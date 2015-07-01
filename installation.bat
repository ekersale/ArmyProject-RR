ECHO "Installation en cours..."
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('./Updates/ArmyProject-RR-master.zip', './Updates'); }"
DEL Updates\\ArmyProject-RR-master.zip
MKDIR Updates\\SaveConfigFile
COPY "*.el" "Updates/SaveConfigFile"

TASKKILL /IM ArmyProject.vshost.exe
setlocal EnableDelayedExpansion
SET exclude=.el.bat.
FOR %%f in (*.*) do (
   IF /I "%exclude%" == "!exclude:%%~Xf.=!" DEL "%%f"
)
RD /s /Q Icons
XCOPY /s Updates\\ArmyProject-RR-master .
RD /s /Q Updates\\ArmyProject-RR-master
ECHO "\n\nInstallation complete...\n\nApplication will restart automatically in 10 seconds.\nIf application doesn't start please contact erasme-rr@hotmail.fr"
TIMEOUT /T 5
START "" "ArmyProject.exe"