# Two devices, A and B, operate on a 230V supply. Device A consumes 650W and has a power factor of
# 0.9. Device B consumes 450W at an unknown power factor. Determine the apparent powe

# 230V doesn't matter

$P_A = 650
$PF_A = 0.9

$P_B = 450
$PF_B = 0.8 # assume as we don't know

$S_A = $P_A / $PF_A 
$S_B = $P_B / $PF_B 

$S = [math]::Round($S_A + $S_B)

Write-Host "total apparent power = $S VA"

