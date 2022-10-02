# Exercise generator for COP 

$C = [math]::Round((Get-Random -Min -20.1 -Max 40.1),0)
$F = [math]::Round($C * 9 / 5 + 32,0)
$K = [math]::Round($C + 273,0)

$Variant = Get-Random -Min 0 -Max 2

switch ( $Variant ) {
0 {
$QuestionText = "Convert $C C to F."
$Target = $F
$Solution = "
F = ( C * 9 / 5 ) + 32 
  = ( $C * 9 / 5 ) + 32
  = ( $($C * 9 / 5 )) + 32
  = $F F
"
}
1 {
$QuestionText = "Convert $F F to C."
$Target = $C
$Solution = "
C = ( F - 32 ) * 5 / 9 
  = ( $F - 32 ) * 5 / 9
  = ( $($F-32) ) * 5 / 9 
  = $C C
"
}
2 {
$QuestionText = "Convert $C C to K."
$Target = $K
$Solution = "
K = C + 273
  = $C + 273
  = $K K
"
}
default {
	Write-Error "Variant $Variant not found"
     Return
}
}

Write-Host $QuestionText

$Answer = Read-Host "Answer = "

Write-Host "Correct answer: = $Answer"	

$NormalisedError = [math]::Round(($Answer - $Target)/$Target,2)
Write-Host "Normalised error: $NormalisedError"

if ( [Math]::Abs($NormalisedError) -lt 0.01 ) {
   Write-Host "your answer was correct"
} else {
  Write-Host "your answer was wrong"
}

