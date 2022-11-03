#!/usr/bin/env pwsh
# Script to check CA for compliance

$allowable_files = @( 'data_centre_ca1.pdf')

$filename = $null

Foreach ( $allowable_file in $allowable_files )
{
    Write-Host "checking for $allowable_file... " -NoNewLine
    if ( Test-Path $allowable_file ) {
	Write-Host "found!"
	$filename = $allowable_file
	break;
    }
    else {
	Write-Host "not found!"
    }
}

if ( $null -eq $filename )  {
    throw "no acceptable file found"
}

Write-Host your file $filename meets submission requirements -ForegroundColor DarkGreen


