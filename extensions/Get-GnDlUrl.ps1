<#
.SYNOPSIS
    Get download URL from specific [GN] gamesnostalgia.com download link

.DESCRIPTION
    Function returns the direct download URL based on available mirrors on gamesnostalgia.com

.EXAMPLE
    PS> Get-GnDlUrl 'https://gamesnostalgia.com/download/GAME_NAME_HERE/ID_NBR'

    Returns the download URL of the application 'GAME_NAME_HERE/ID_NBR'.

.OUTPUTS
    [String] or $null
#>
function Get-GnDlUrl {
	[CmdletBinding()]
    Param
    (
		[ValidatePattern('^https:(?:\/){2}gamesnostalgia.com\/download\/[\w-]+\/\d+$')] [Parameter(Mandatory = $true)] [string] $srcURL
    )
    Begin
    {
		Set-StrictMode -Version 2
		$ErrorActionPreference = 'Stop'
	}
	End
    {
		# Write-Host $srcURL
        $scriptRoot = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
        $jsScript = "$(Join-Path $scriptRoot getUrl.js)"
		$tokenURL = $(phantomjs.exe $jsScript $srcURL)
		return $tokenURL
	}
}
