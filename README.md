# apstra_lab
## Pre-requisites

1. Centos 7.6 installed on physical server
2. Physical server requirements (128 GB RAM, 1TB disk)

## Pre-deployment steps

### Install and configure necessary packages on server

System update and packages install
```
yum -y update
yum -y install qemu-kvm qemu-img virt-manager libvirt libguestfs-tools libvirt-python \
libvirt-client virt-install virt-viewer bridge-utils git ntp net-tools iptables iptables-services \
epel-release byobu tmux vim jq
```

Update server section to ntp.juniper.net in /etc/ntp.conf
```
server ntp.juniper.net
```

Configure packages and system reboot
```
systemctl disable firewalld
systemctl stop firewalld
systemctl enable iptables
systemctl start iptables
systemctl enable ntpd
systemctl restart ntpd
systemctl stop chronyd
systemctl disable chronyd
systemctl enable libvirtd
systemctl start libvirtd
virsh net-destroy default
virsh net-undefine default
iptables -F
/usr/libexec/iptables/iptables.init save
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
ssh-keygen
reboot
```

### Deploy Apstra lab

```
git clone https://github.com/PrzemekGrygiel/apstra_lab.git
mkdir -p apstra_lab/2spine4leafs/images
```

>>>
Download images and copy to directory apstra_lab/[scenario]/images vQFX and Apstra AOS images

Then edit deploy.sh to update versions
```
VQFX_PFE=$PWD/images/vqfx-20.3R1-2019010209-pfe-qemu.qcow2
VQFX_RE=$PWD/images/vqfx-20.3R1.8-re-qemu.qcow2
APSTRA_SRV=$PWD/images/aos_server_3.3.0c-26.qcow2
APSTRA_ZTP=$PWD/images/apstra-ztp-2.0.0-60.qcow2
```
>>>

```
cd ..
./deploy.sh
```

### The procedure to fix vQFX for ZTP
https://github.com/PrzemekGrygiel/apstra_lab/blob/main/vqfx_patch/README.md

