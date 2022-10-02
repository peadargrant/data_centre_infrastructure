# COP to EER conversion exercise

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

$COP = [math]::Round((Get-Random -Minimum 1.2 -Maximum 5.0),1)
$EER = [math]::Round(3.412 * $COP,1)

$Variant = [math]::Round((Get-Random -Minimum -0.2 -Maximum 1.2),0)

switch ($Variant) {
0 {
$QuestionText = "A cooling system has an EER of $EER. Convert to COP."
$Target = $COP
$Solution = "
COP = EER / 3.412
    = $EER / 3.412
    = $COP ... no units! 
"
}

1 {
$QuestionText = "A cooling system has a COP of $COP. Covert to EER."
$Target=$EER
$Solution = "
EER = COP * 3.412
    = $COP * 3.412
    = $EER ... no units! 
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

