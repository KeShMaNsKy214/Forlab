$dir   = 'C:\Lab'
$proof = "$dir\executed.txt"

try { [void](New-Item -ItemType Directory -Path $dir -Force -ErrorAction Stop) } catch { exit 1 }

$entry = "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] user=$env:USERDOMAIN\$env:USERNAME computer=$env:COMPUTERNAME pid=$PID"

try { Add-Content -Path $proof -Value $entry -Encoding UTF8 } catch { exit 1 }
