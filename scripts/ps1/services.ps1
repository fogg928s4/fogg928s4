# Get Directories

param (
    [string]$Path,
    [string]$Command
)

function Main {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,                # Folder to scan
        [switch]$FullPath ,             # Show full paths instead of just names

        [Parameter(Mandatory = $true)]
        [string]$Command   # Command that will be run
    )

    try {
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA$Path"
        $Services = Get-Directories -SearchPath $Path

        Write-Host "Running Command ${Command} on ${Path} ..."
        wt split-pane -p "Powershell" -d $Services[0] 
        wt split-pane -p "Powershell" -d $Services[1] 

        # GOTTA RUN THIS (4 tabs)
        # wt -p "CMD" `; -d "C:\Users\roberto.melgares\Documents" `; `;
    }
    catch {
        Write-Error "You messed it up..."
        <#Do this if a terminating exception happens#>
    }
}


function Get-Directories {
    param (
        [string]$SearchPath
    )
    if (-not (Test-Path -Path $SearchPath -PathType Container)) {
        throw "The specified path '$SearchPath' does not exist or is not a directory."
    }
    $dirs = Get-ChildItem -Path $SearchPath -Directory -ErrorAction Stop

    return $dirs
}

Main -Path $Path -Command $Command