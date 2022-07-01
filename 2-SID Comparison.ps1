clear
$ownerData = Import-Csv $PSScriptRoot\output.csv

$uniqueSIDS = $ownerData | select * | sort-object owner -Unique

foreach ($file in $uniqueSIDS)
{
    $path = $file | select "Full Path" -ExpandProperty "Full Path"
    $path = $path.replace("Y:\","Z:\")
    $owner = get-acl $path | select owner -ExpandProperty owner |format-list
    $owner = $owner | Out-String
    $file."Full Path" = $owner
}

foreach ($line in $ownerData)
{
    foreach ($match in $uniqueSIDS)
    {
        $match."Full Path" = $match."Full Path".trim()
        if ($match.owner -eq $line.owner)
        {
            $line.owner = $match."Full Path"
        }
    }
}
$ownerData | export-csv -path $PSScriptRoot\resolved.csv -Delimiter '`'
