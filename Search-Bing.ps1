<#
.NOTES
	Author: Nathan Davenport
    Date  : 2009/03/18

    Copyright © 1984-  Nathan Davenport. All rights reserved.
    Free for all users, but leave in this header

.SYNOPSIS
   BingR - Open Microsoft Edge browser and randomly search Bing

.DESCRIPTION
   Open Microsoft Edge browser and randomly search Bing
      web - regular web search
      images - search images
      videos - search videos
      news - search news
#>

Function Search-Bing {
    <#
	.SYNOPSIS
        Search-Bing - search bing multiple times

	.DESCRIPTION
        Get-Rndword - Performs random Bing searches a specified qty of times

	.PARAMETER qty
        number of Bing searches to perform

    .EXAMPLE

        PS> Search-Bing 3

	.LINK
        
	#>
    Param(
        [int]$qty = 1,
        [int]$min = 3,
        [int]$max = 30,
        [ValidateSet('web','images','videos','news','shop')] $choice,
        [char[]]$types = "bvclumnsa",
        [int]$Pause = 0
    )

    Begin{
    }
    Process{
        for ($i = 1; $i -le $qty; $i++){
            if ($choice -eq $null) {
                $type = Get-Random -input "web","images","videos","news","shop"
            }
            else {
                $type = $choice
            }
            Switch ($type) {
                web		{ Start-Process "microsoft-edge:http://bing.com/Search?q=$(Get-Rndword (Get-Random -Minimum $min -Maximum $max) $types)" }
                images	{ Start-Process "microsoft-edge:http://bing.com/images/Search?q=$(Get-Rndword (Get-Random -Minimum $min -Maximum $max) $types)" }
                videos	{ Start-Process "microsoft-edge:http://bing.com/videos/Search?q=$(Get-Rndword (Get-Random -Minimum $min -Maximum $max) $types)" }
                news	{ Start-Process "microsoft-edge:http://bing.com/news/Search?q=$(Get-Rndword (Get-Random -Minimum $min -Maximum $max) $types)" }
                shop	{ Start-Process "microsoft-edge:http://bing.com/Shop?q=$(Get-Rndword (Get-Random -Minimum $min -Maximum $max) $types)" }
            }
            if ($Pause -ne 0) {
                Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum $Pause)
            }

        }
    }
    End {
    }
}