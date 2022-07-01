for /f "usebackq tokens=1,2 delims=` skip=2" %%a in ("resolved.csv") do (
	icacls %%a /setowner %%b /q
)
timeout 10