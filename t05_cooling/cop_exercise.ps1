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

$PowerInput_kW = [math]::Round((Get-Random -Min 4.9 -Max 50.1),1)
$COP = [math]::Round((Get-Random -Min 1.5 -Max 5.5),1)
$CoolingOutput_kW = [math]::Round($PowerInput_kW * $COP,1)

$Variant = Get-Random -Min 0 -Max 2

switch ( $Variant ) {
0 {
$QuestionText = "A cooling system consumes $PowerInput_kW kW of electrical power to provide $CoolingOutput_kW kW of cooling. Determine the COP."
$Target = $COP
$Units = ""
$Solution = "
COP = ( Cooling delivered in kW) / (Power input in kW) 
    = $CoolingOutput_kW kW / $PowerInput_kW kW
    = $COP  ... COP has no units!
"
}
1 {
$QuestionText = "A cooling system consumes $PowerInput_kW kW of electrical power and has a COP of $COP. Determine the cooling power provided in kW."
$Target = $CoolingOutput_kW
$Units = "kW"
$Solution = "
Cooling output = (Power input in kW) * COP 
               = $PowerInput_kW kW * $COP 
               = $CoolingOutput_kW kW
"
}
2 {
$QuestionText = "A cooling system has a COP of $COP and delivers $CoolingOutput_kW kW of cooling power. Determine the electrical input in kW."
$Target = $PowerInput_kW
$Units = "kW"
$Solution = "
Power input = (Cooling output in kW) / COP 
            = $CoolingOutput_kW kW / $COP
            = $PowerInput_kW kW
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

