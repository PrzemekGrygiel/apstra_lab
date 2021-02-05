# This is scenario with 2 spine and 4 leaf switches organised in 2 racks.
![](https://github.com/PrzemekGrygiel/apstra_lab/blob/main/diagrams/2s4l2c.png)

Each rack has connected 1 server with preconfigured LACP bond (mode: 802.ad, lacp-rate: fast)

### *compute1* 
- mgmt (eth0) interface IP: 172.16.0.5/24, 
- bond0 interface IP 192.168.0.5/24 
- user root, 
- password Juniper
- console access: virsh console compute1

### *compute2* 
- mgmt (eth0) interface IP: 172.16.0.6/24, 
- bond0 interface IP 192.168.0.6/24 
- user root, 
- password Juniper
- console access: virsh console compute2
