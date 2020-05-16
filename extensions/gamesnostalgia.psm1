$scriptRoot = Split-Path -Path $MyInvocation.MyCommand.Definition

$publicFunctions = @(
    'Get-GnDlUrl'
)

Get-ChildItem -Path "$scriptRoot\*.ps1" | ForEach-Object { . $_ }
Export-ModuleMember -Function $publicFunctions
