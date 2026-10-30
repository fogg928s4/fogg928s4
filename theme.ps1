# Set Windows default theme to Dark mode
# This affects both system UI and apps

try {
    # Registry path for theme personalization
    $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"

    # Set System theme to Dark (0 = Dark, 1 = Light)
    Set-ItemProperty -Path $regPath -Name "SystemUsesLightTheme" -Value 0

    # Set Apps theme to Dark (0 = Dark, 1 = Light)
    Set-ItemProperty -Path $regPath -Name "AppsUseLightTheme" -Value 0

    Write-Host "✅ Dark theme enabled for system and apps." -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to change theme. Error: $($_.Exception.Message)" -ForegroundColor Red
}
