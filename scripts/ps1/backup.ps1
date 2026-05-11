$destino="F:\\Backup\\Imágenes"
$tipo="*.mp3"

for ($i = 1; $i -le 26; $i++) {
    Write-Host "Directory Number: $i"
    Set-Location "recup_dir.$i"
    Write-Host "Copying $tipo files from dir $i ..." -ForegroundColor Yellow
    Copy-Item "$tipo" $destino -Verbose 
    Set-Location ..
}