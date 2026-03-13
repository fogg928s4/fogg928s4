# Get Directories

param (
    [Parameter(Mandatory = $true)]
    [string]$Path,                # Folder to scan
    [switch]$FullPath ,             # Show full paths instead of just names

    [Parameter(Mandatory = $true)]
    [string]$Command   # Command that will be run
)

try {
    if (-not (Test-Path -Path $Path -PathType Container)) {
        throw "The specified path '$Path' does not exist or is not a directory."
    }

    Write-Host "Running Command ${Command} on ${Path} ..."



}
catch {
    Write-Error "You messed it up..."
    <#Do this if a terminating exception happens#>
}