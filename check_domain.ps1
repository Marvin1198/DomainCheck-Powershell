# Check if the computer is in a domain
$domainInfo = Get-WmiObject -Class Win32_ComputerSystem
if ($domainInfo.PartOfDomain -eq $true) {
    Write-Host "The computer is a member of a domain."

    # Check if the computer is a domain controller
    $domainController = Get-ADDomainController -Discover
    if ($domainController) {
        Write-Host "The computer is a domain controller."
        Start-Sleep -Seconds 3
    } else {
        Write-Host "The computer is not a domain controller."
    }
} else {
    Write-Host "The computer is not a member of a domain."
}
