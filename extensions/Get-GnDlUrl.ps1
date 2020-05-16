<#
.SYNOPSIS
    Get download URL from specific [GN] gamesnostalgia.com download link

.DESCRIPTION
    Function returns the direct download URL based on available mirrors on gamesnostalgia.com

.EXAMPLE
    PS> Get-GnDlUrl 'https://gamesnostalgia.com/download/GAME_NAME_HERE/ID_NBR'

    Returns the download URL of the application 'GAME_NAME_HERE/ID_NBR'.
	# ValidatePattern('^http:(?:\/){2}cdn.gamesnostalgia.com\/files(?:\/\w+){3}\/\w+.\w+$')

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
		Write-Host $srcURL
		$tokenURL = $(phantomjs.exe getUrl.js $srcURL)
		return $tokenURL
	}
}
