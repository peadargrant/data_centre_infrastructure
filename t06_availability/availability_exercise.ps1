#!/usr/bin/env pwsh
# Exercise generator for availability

param(
[Parameter()]
[int] $Variant = (Get-Random -Min 0 -Max 2)
)

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

switch ( $Variant ) {
0 {
$t = [math]::Round((Get-Random -Min 10 -Max 20),0)
$failureRate = [math]::Round((Get-Random -Min 0.1 -Max 0.3),1)
$reliability = [math]::Round([math]::exp(-$failureRate*$t),3)
$tunit = "day"

$QuestionText = "Calculate the reliability of a system at time t=$t $($tunit)s assuming that it experiences on average $failureRate failures per $tunit."

$Target = $reliability
$Units = ""
$Solution = "
      
R = e ^ ( - lambda * t)
  = e ^ ( - $failureRate * $t ) 
  = $reliability
"
}
1 {
$MTBF = [math]::Round((Get-Random -Min 100 -Max 200),0)
$years = [math]::Round((Get-Random -Min 2 -Max 10),0)
$nFailures = [math]::Round(($years * 365) / $MTBF,0)

$QuestionText = "A system has $nFailures failures over the course of $years years. Calculate the MTBF in days."
$Target = $MTBF
$Units = "days"
$Solution = "
MTBF = 1 / ( failure rate ) 
     = 1 / ( number of failures / time period ) 
     = ( time period ) / ( number of failures ) 
     = $($years * 365) / ( $nFailures ) 
     = $MTBF $Units
"
}
default {
	Write-Error "Variant $Variant not found"
     Return
}
}

Clear-Host
Write-Host "Question variant $Variant"
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

