
<#
.SYNOPSIS
Locate Hyper-V virtual network adapter MAC addresses.
.DESCRIPTION
Locate Hyper-V virtual network adapter MAC addresses. With default settings, will scan the indicated hosts and generate a report of all adapters, virtual and physical, that use the same MAC in the same VLAN.
.PARAMETER ComputerName
Name of one or more hosts running Hyper-V. If -HostFile is also set, uses both sources. If neither is set, uses the local system.
.NOTES
Author:Dongjie
Version 1.0, forth 27, 2019
Released license
.INPUTS
String[]
.LINK
https://ejsiron.github.io/Posher-V/Get-VMMacConflict
#>


<#
.EXAMPLE
local Hyper-V host, list the MAC addresses of all virtual machines
#>

Get-VM | Get-VMNetworkAdapter | ft VMName, MacAddress

# OUTPORT RESULT

VMName                                                                               MacAddress                                                                         
------                                                                               ----------                                                                         
BJSS01-N-20001                                                                       00155D77971E                                                                       
BJSS02-N-20002                                                                       00155D77971F                                                                       
BJSS03-S-20001                                                                       00155D77780C                                                                       
BJSS04-S-20002                                                                       00155D77780D      


<#
.EXAMPLE
To list MAC addresses of all virtual machines on all Hyper-V servers
#>

$HypervServers = @("HyperV-01", "HyperV-02", "HyperV-03")
foreach ( $HypervServer in $HypervServers ) {
	Get-VM -Computername $HyperVServer | Get-VMNetworkAdapter | ft VMName, MacAddress
}

# OUTPORT RESULT



VMName                                                                                          MacAddress                                                                                    
------                                                                                          ----------                                                                                    
BJSS01-S-40001                                                                                  00155DD3FC05                                                                                  
Oracle-BJSS02-N-00001                                                                           00155DEA5015                                                                                  
vm01-0001                                                                                       00155DAAD403                                                                                  



VMName                                                                                          MacAddress                                                                                    
------                                                                                          ----------                                                                                    
BJSSSI-BR-12004                                                                                 00155D649B31                                                                                  
BJSSSI-N-12004                                                                                  00155D779726                                                                                  
BJSSSI-N-12008                                                                                  00155D99D30D                                                                                  
BJSSSI-N-18002                                                                                  00155D649B2D                                                                                  
BJSSSI-N-96011                                                                                  00155D649B2F                                                                                  


<#
.EXAMPLE
To list MAC addresses of all virtual machines on per remote Hyper-V server basis
#>

$HypervServers =INPUT Remote Server  

Get-VM -Computername hyper-v_server | Get-VMNetworkAdapter | ft VMName, MacAddress

# OUTPORT RESULT

VMName                                                                                          MacAddress                                                                                    
------                                                                                          ----------                                                                                    
BJSSSI-BR-12004                                                                                 00155D649B32                                                                                  
BJSSSI-S-12004                                                                                  00155D779723                                                                                  
BJSSSI-S-12008                                                                                  00155D99D304                                                                                  
BJSSSI-S-18002                                                                                  00155D649B25                                                                                  
BJSSSI-S-96011                                                                                  00155D649B26 



