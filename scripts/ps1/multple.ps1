$destino="F:\\Backup\\Vídeos"
$tipo1="*.avi"
$tipo2="*.flv"
$tipo3="*.wmv"

for ($i = 1; $i -le 26; $i++) {
    Write-Host "Directory Number: $i"
    Set-Location "recup_dir.$i"
    Write-Host "Copying $tipo1 files from dir $i ..." -ForegroundColor Yellow
    Copy-Item "$tipo1" $destino -Verbose
    Write-Host "Copying $tipo2 files from dir $i ..." -ForegroundColor Yellow
    Copy-Item "$tipo2" $destino -Verbose
    Write-Host "Copying $tipo3 files from dir $i ..." -ForegroundColor Yellow
    Copy-Item "$tipo3" $destino -Verbose 
    Set-Location ..
}s