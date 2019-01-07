#
# Module manifest for module 'PSGet_NVRAppDevOps'
#
# Generated by: Kamil Sacek
#
# Generated on: 13.06.2018
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'NVRAppDevOps.psm1'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'dc28788e-07b6-42c2-88b0-7cdc5fa6abd6'

# Author of this module
Author = 'Kamil Sacek'

# Company or vendor of this module
CompanyName = 'NAVERTICA a.s.'

# Copyright statement for this module
Copyright = '(c) 2018 Kamil Sacek'

# Description of the functionality provided by this module
Description = 'cmdlets for DevOps for Business Central'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @('navcontainerhelper')

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = '*'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = '*'

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Version number of this module.
ModuleVersion = '0.9.46'


# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'PSModule'

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://www.github.com/kine/NVRAppDevOps'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = @'
0.9.47        
- Fixed Get-ALAppOrder bug with default parameter set
- Added possibility to pass password and RAM through pipeline

0.9.46
- Running under Build agent on Azure DevOps but no output formated bug fixed (@MJECloud)

0.9.45
- Added different password dialogs in Init-ALEnvironment based on Authentication method
- Added new parameters to Publish-AlApp and Publish-AlAppTree
- Fix from @MJECloud regarding singing the app when NavUserPassword authentication used
- Added possibility to pass array with app.json files to process in Get-ALAppOrder (@MJECloud)

0.9.44
- Fixedmissing & in Sign-ALApp

0.9.43
- Fixed missing } in Compile-ALProjectTree

0.9.42
- Fixed Compile-ALProjectTree
- Sign in container in Compile-ALProjectTree

0.9.41
- SignTool existence test added
        
0.9.38
- Fixing bug in Compile-ALProjectTree to support NavUserPassword

0.9.36-0.9.37
- Added package id prefix support for install-alnugetpackage and New-ALNuSpec

0.9.35
- Added support for Version attribute in dependencies when creating nuspec file

0.9.27-0.9.34
- Fixed bugs connected to Container usage to get app info needed for Get-ALAppOrder function running in release pipeline

0.9.26
- Using container to get info about App file in Get-ALAppOrder to support release pipeline

0.9.25
- Added UpdateDevOpsBuildNo to set Azure DevOps build version based on the new App build in Set-ALAppBuildNo

0.9.24
- Added Recurse parameter for Get-ALAppOrder to be able to find app files in subfolders

0.9.19-0.9.23
- Bug hunting fixes for Compile script

0.9.18
- Fixed Compile-ALAppTree in container support
- Added flag to skip import of test toolkit in Init-ALEnvironment

0.9.17
- Fixed Init-ALEnvironment parameters for volume

0.9.16
- Fixed Init-ALEnvironment MainLoop override bug

0.9.15
- Added parameter useBestContainerOS when creating environment

0.9.14
- Modified Set-ALAppBuildNo to include only MainApp and TestApp and use same Build and Revision for both

0.9.13
- Added Set-ALDockerHostFolder

0.9.12
- Added Set-ALAppBuildNo script

0.9.11
- Fixed Unpublish-AlAppTree

0.9.10
- Add AssignPremiumPlan
- Add updateHost

0.9.9 
- Fixed parameters in Download-ALSystemPackages

0.9.8 
- Fixed condition in Download-ALSystemPackages

0.9.7 
- Addd navcontainerhelper as dependency
- Fixed missing bracket

0.9.6
- Added force flag to Download-ALSystemPackages

0.9.5
- Added RAM size parameter
'@

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

