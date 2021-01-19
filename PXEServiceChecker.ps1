<#
.SYNOPSIS
    The script checks the PXE service status

.DESCRIPTION
    

.PARAMETER DemoParam1
    

.PARAMETER DemoParam2
    

.EXAMPLE
   

.EXAMPLE
    

.NOTES
    Author: flashp0wa
    Last Edit: 9/3/2020 
    Version 1.0 - Initial release

#>

$PXEResponder = (get-service | Where-Object name -eq "sccmpxe").status

if ($PXEResponder -eq "Stopped") {
    $return = "Stopped"
}
elseif ($null -eq $PXEResponder) {
    $PXEWDS = (get-service | Where-Object name -eq "WDSServer").status
        if ($PXEWDS -eq "Stopped") {
            $return = "Stopped"
        }
        else {
            $return = "Running"
        }
    }
else {
    $return = "Running"
}


$return