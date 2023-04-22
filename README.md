# cisco-iac-c9k

## EVPN

### Terraform

#### Guide for deploying BGP EVPN on Catalyst 9000 Switches
Prerequisites:
- Catalyst 9000 Switching Platforms (C9300/C9400/C9500/C9600)
- Cisco IOS-XE 17.8+
- Cisco Network Advantage / DNA Advantage
- Underlay network (connectivity between all the nodes)
- RESTCONF enabled
- Terraform CLI

[Tutorial](./evpn/terraform/tutorial/)  
[Public Registry](https://registry.terraform.io/providers/robertcsapo/ciscoevpn/latest)  
[Source Code](https://github.com/robertcsapo/terraform-provider-ciscoevpn)  

### Ansible

## Application Hosting (IOX)

### Terraform
#### Guide for deploying Applications (containers) on Catalyst 9300 Switches
Prerequisites:
- Catalyst 9000 Switching Platforms (C9300)
- Cisco IOS-XE 17.8+
- Cisco Network Advantage / DNA Advantage
- RESTCONF enabled
- Terraform CLI

[Tutorial](./apphosting/terraform/tutorial/)  
[Public Registry](https://registry.terraform.io/providers/robertcsapo/ciscoapphosting/latest)  
[Source Code](https://github.com/robertcsapo/terraform-provider-ciscoapphosting) 