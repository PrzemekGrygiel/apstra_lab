# This is scenario with 2 spine and 4 leaf switches, 2 border leafs organised in 3 racks for NSX-T integration testing.
![](https://github.com/PrzemekGrygiel/apstra_lab/blob/main/diagrams/2s4l2bNSXT.png)

Each rack has connected 1 server with preconfigured LACP bond (mode: 802.ad, lacp-rate: fast)

### *BMS1* 
- mgmt (eth0) interface IP: 172.16.0.5/24, 
- bond0 interface IP 192.168.0.5/24 
- user root, 
- password Juniper
- console access: virsh console compute1

### *BMS2* 
- mgmt (eth0) interface IP: 172.16.0.6/24, 
- bond0 interface IP 192.168.0.6/24 
- user root, 
- password Juniper
- console access: virsh console compute2

### *AOS server* 
- mgmt (eth0) interface IP: 172.16.0.200/24 (sugested)
- user admin, 
- password admin,
- console access: virsh console  aos-srv

### *ZTP server* 
- mgmt (eth0) interface IP: 172.16.0.201/24 (sugested)
- user admin, 
- password admin,
- console access: virsh console  aos-ztp
