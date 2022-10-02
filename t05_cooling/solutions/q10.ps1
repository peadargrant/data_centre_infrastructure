# A data centre environment hosts 16kW of IT loads in a closed space. The UPS units are located within
# the racks and add an additional 25% to the IT load at their current load. The cooling system has a COP of
# 4.5. Based on this information, determine the PUE

$ITPower = 16

$UPSExtra = 0.25
$UPSPower = $ITPower * $UPSExtra

$CoolingRequired = $ITPower + $UPSPower
Write-Host "Cooling Required = $CoolingRequired"

$COP = 4.5
$CoolingPower = $CoolingRequired / $COP 
Write-Host "Cooling Power = $CoolingPower"

$NonITPower = $UPSPower + $CoolingPower
Write-Host "Non-IT Power = $NonITPower"

$PUE = [math]::Round(1 + $NonITPower / $ITPower,1)

Write-Host "PUE = $PUE"
