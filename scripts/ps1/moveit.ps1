$destino="F:\\Backup\\Word"
$tipo="*.docx"

for ($i = 1; $i -le 26; $i++) {
    Write-Host "Directory Number: $i"
    Set-Location "recup_dir.$i"
    Write-Host "Moving $tipo files from dir $i ..." -ForegroundColor Yellow
    Move-Item $tipo $destino -Verbose
    Set-Location ..
}