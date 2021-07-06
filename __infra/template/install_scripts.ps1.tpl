# Placeholder
# when this script executes, the current directory on the computer is c:\playground



# Samer, put your powershell install scripts here

choco install -y eclipse

Get-VM “ContainerHost” | Set-VMProcessor -ExposeVirtualizationExtensions $true
Get-VMNetworkAdapter -VMName “ContainerHost” | Set-VMNetworkAdapter -MacAddressSpoofing On

Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Install-Package -Name docker -ProviderName DockerMsftProvider
