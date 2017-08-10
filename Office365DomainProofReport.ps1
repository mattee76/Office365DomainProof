add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
 
$DomainProofCollection = @()
 
$AcceptedDomains = Get-AcceptedDomain
$Certificate = Get-ExchangeCertificate | where {$_.services -like "*Federation*"}
 
foreach ($domain in $AcceptedDomains){
 
	$DomainProofCollection += Get-FederatedDomainProof -DomainName $domain.DomainName.SmtpDomain -Thumbprint $Certificate.Thumbprint
 
}
 
$DomainProofCollection | Export-Csv "$($env:temp)\DomainProofExportJusticeNet.csv"
 
Write-Host "$($env:temp)\DomainProofExportJusticeNet.csv"
