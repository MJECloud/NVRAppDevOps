<#
.SYNOPSIS
    Compile all AL projects in the folder tree
.DESCRIPTION
    Read all app.json files in the folder tree and compile the apps in order to fullfill dependencies of the apps.
    Dependencies which are not stored as source code in the tree must be placed to output path first as app files.

.EXAMPLE
    PS C:\> Read-ALConfiguration -Path <repopath> | Compile-ALProjectTree -OrderedApps (Get-ALAppOrder -Path <repopath>) -PackagesPath <outputpath> -CertPwd <certpwd> -CertPath <certpath>
    Will read the configuration for the repo (container name etc.) and will create app files in <outputpath> for all apps inside the tree.
    Apps will be signed by selected certificate with given password

.Parameter ContainerName
    Name of the container to use during compilation to get alc.exe etc.

.Parameter CertPath
    Path to certificate for signing the apps. If not defined, apps will not be signed    

.Parameter CertPwd
    Password for the signing certificate

.Parameter OrderedApps
    Array of Apps Info objects in order of compilation. You can use Get-ALAppOrder function to get it

.Parameter PackagesPath
    Path where resulting .app files will be stored and which includes dependencies necessary for compiling the apps.    

#>
function Compile-ALProjectTree 
{
    Param (
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        $ContainerName,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        $CertPath,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        $CertPwd,
        $OrderedApps,
        $PackagesPath
    )
    if (-not $PackagesPath) {
        $PackagesPath = Get-Location
    }
    foreach ($App in $OrderedApps) {
        Write-Host "**** Compiling $($App.name) ****"
        $ALC = (Get-ChildItem "C:\ProgramData\NavContainerHelper\Extensions\$ContainerName\" -Filter alc.exe -Recurse).FullName
        Write-Host "Running $ALC for $($App.name)"
        $AppPath = Split-Path -Path $App.AppPath
        Push-Location
        Set-Location $AppPath
        $escparser = '--%'
        $AppFileName = "$($App.publisher)_$($App.name)_$($App.version).app"
        Write-Host "Generating $AppFileName..."
        
        & $ALC $escparser /project:.\ /packagecachepath:"$PackagesPath"  | Convert-ALCOutputToTFS

        if ($CertPath) {
            Write-Host "Signing the app..."
            SignTool sign /f $CertPath /p $CertPwd /t http://timestamp.verisign.com/scripts/timestamp.dll $AppFileName
        }
        Copy-Item -Path $AppFileName -Destination $PackagesPath
        Pop-Location
    }
}