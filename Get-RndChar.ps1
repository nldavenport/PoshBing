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

Function Get-RndChar { 
    <#
	.SYNOPSIS
        Get-Rndchar - returns a random character of specified type

	.DESCRIPTION
        Get-Rndchar - Return a random character based on a type of character specified

	.PARAMETER chartype
	    Type of Character to return

    .INPUTS
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
        PS> Get-Rndchar "v"

    .EXAMPLE
        PS> Get-Rndchar "a"

	.LINK
        
	#>
    Param(
        [char]$chartype
    )

    Begin{
        $Blank = " "
        $Vowels = "aeiouy"
        $Consenants = "bcdfghjklmnpqrstvwxyz"
        $UpperCase = "$($Consenants.ToUpper())$($Vowels.ToUpper())"
        $LowerCase = "$($Consenants.ToLower())$($Vowels.ToLower())"
        $MixedCase = "$($UpperCase)$($LowerCase)"
        $Numbers = "1234567890"
        $SpecialChars = "!@#$%^&*()-=_+[]{}\|;:',./<>?"
        $AllowedChars = "$($MixedCase)$($Numbers)$($SpecialChars)($Blank)"
    }
    Process{
        Switch ($chartype) {
            b { $char = $Blank }
            V { $char = $Vowels.Substring((Get-Random -Minimum 1 -Maximum $Vowels.length),1) }
            c { $char = $Consenants.Substring((Get-Random -Minimum 1 -Maximum $Consenants.length),1) }
            u { $char = $UpperCase.Substring((Get-Random -Minimum 1 -Maximum $UpperCase.length),1) }
            l { $char = $LowerCase.Substring((Get-Random -Minimum 1 -Maximum $LowerCase.length),1) }
            m { $char = $MixedCase.Substring((Get-Random -Minimum 1 -Maximum $MixedCase.length),1) }
            n { $char = $Numbers.Substring((Get-Random -Minimum 1 -Maximum $Numbers.length),1) }
            s { $char = $SpecialChars.Substring((Get-Random -Minimum 1 -Maximum $SpecialChars.length),1) }
            a { $char = $AllowedChars.Substring((Get-Random -Minimum 1 -Maximum $AllowedChars.length),1) }
        }
        return $char
    }
    End {
    }
}