# This is scenario with 2 spine and 6 leaf switches organised in 3 racks.
![](https://github.com/PrzemekGrygiel/apstra_lab/blob/main/diagrams/2s6l.png)

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