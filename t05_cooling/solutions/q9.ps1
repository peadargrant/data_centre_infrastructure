# A server room contains 5.8kW of IT loads in a closed space. A cooling system with a COP of 5.2 is proposed
# to be installed. No other non-IT loads are located within the closed space. Determine the PUE.

$ITPower = 5.8

$COP = 5.2
$CoolingRequired = $ITPower
$CoolingPower = $CoolingRequired / $COP 

$PUE = [math]::Round(1 + ( $CoolingPower ) / $ITPower,1)

Write-Host "PUE = $PUE"


