# Exercise generator for COP 

$GreenCheck = @{
  Object = [Char]8730
  ForegroundColor = 'Green'
  NoNewLine = $true
  }

$RedX = @{
    Object =  'X'
    ForegroundColor = 'Red'
    NoNewLine = $true
}

$T = [math]::Round((Get-Random -Min 4.9 -Max 35.1),1)
$RH = [math]::Round((Get-Random -Min 4.9 -Max 95.1),0)
$Tdp = [math]::Round($T - ( 100 - $RH ) / 5,1)

$Variant = Get-Random -Min 0 -Max 1

switch ( $Variant ) {
0 {
$QuestionText = "Use the simplified magnus formula to determine the dew point of air at $T C with a relative humidity of $RH %."
$Target = $Tdp
$Units = "C"
$Solution = "
Tdp = T - ( 100 - RH ) / 5 
    = $T - ( 100 - $RH ) / 5 
    = $T - ( $(100 - $RH) ) / 5
    = $Tdp C
"
}
1 {
$QuestionText = "Use the simplified magnus formula to determine the relative humidity of air at $T C with a dew point of $Tdp C."
$Target = $RH
$Units = "%"
$Solution = "
RH = 100 - 5 * ( T - Tdp ) 
   = 100 - 5 * ( $T - $Tdp ) 
   = $RH %
"
}
default {
	Write-Error "Variant $Variant not found"
     Return
}
}

Clear-Host
Write-Host $QuestionText
Write-Host " "

$Answer = Read-Host "Enter answer [$Units]"
Write-Host " "

$Target = [math]::Round($Target,2)
$NormalisedError = [math]::Round(($Answer - $Target)/$Target,2)

if ( [Math]::Abs($NormalisedError) -lt 0.01 ) {
  Write-Host @GreenCheck 
  Write-Host " your answer was correct"
} else {
  Write-Host @RedX
  Write-Host " your answer was wrong"
}
Write-Host " "

Write-Host $Solution -ForegroundColor Yellow

Write-Host " "

Write-Host "Correct answer = $Target $Units" -ForegroundColor Cyan	
Write-Host "Normalised error: $NormalisedError"

Write-Host ""

