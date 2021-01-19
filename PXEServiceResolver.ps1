<#
.SYNOPSIS
    The script starts the stopped PXE service

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
    Start-Service sccmpxe
}
elseif ($null -eq $PXEResponder) {
    Start-Service WDSServer
}
else {
    Write-Host "All good"
}

