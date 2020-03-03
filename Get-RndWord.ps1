<#
.NOTES
	Author: Nathan Davenport
	Date  : yyyy/mm/dd

	Copyright © 1984-  DRock Development. IsladBoy Holdings. All rights reserved.
	Free for all users, as long as this header is included

.SYNOPSIS
	Script is an assortment of ... 
.DESCRIPTION
	The Script module of cmdlets is a group of tools to ... 
#>

Function Get-RndWord { 
    <#
	.SYNOPSIS
        Get-Rndword - returns a random 'word' of specified qty of characters

	.DESCRIPTION
        Get-Rndword - returns a random 'word' of specified qty of characters

	.PARAMETER qty
        length of 'word' (number of characters)

	.PARAMETER Types
        types of characters to use when making random 'word'
        "b" - blank (space)
        "v" - vowel
        "c" - consenant
        "l" - lowercase
        "u" - uppercase
        "m" - mixedcase
        "n" - number
        "s" - symbol
        "a" - all

    .EXAMPLE
        PS> Get-Rndword 7

    .EXAMPLE
        PS> Get-Rndword 7 "mnSa"

	.LINK
        
	#>
    Param(
        [int]$qty,
        [char[]]$types = "bvclumnsa"
    )

    Begin{
    }
    Process{
        for ($i=1; $i -le $qty; $i++) {
            $Word = "$($word)$(Get-Rndchar(Get-Random -input $types))"
        }
        return $word
    }
    End {
    }
}