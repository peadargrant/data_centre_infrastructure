#An IT device has an 
# apparent power requirement of 750 W
# Its real power is 680 W. Determine:
#(a) Its power factor.
#(b) The reactive power component.

$ApparentPower = 750
$RealPower = 680

$PowerFactor = [math]::round($RealPower / $ApparentPower,1)

Write-Host "power factor = $PowerFactor"

# |S|^2 = P^2 + Q^2 
# 
#   ---------------|
#  /  |S|^2 - P^2    = Q 
#\/

$S = $ApparentPower
$P = $RealPower

$Q = [math]::sqrt($S*$S - $P*$P)
$Q = [math]::round($Q) 

Write-Host "reactive power = $Q VAr"

