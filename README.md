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
mkdir -p apstra_lab/2spines4leafs/images
```

>>>
Download images and copy to apstra_lab/2spines4leafs/images vqfx and Apstra aos images
in ./deploy.sh update versions
```
VQFX_PFE=$PWD/images/vqfx-20.2R1-2019010209-pfe-qemu.qcow2
VQFX_RE=$PWD/images/vqfx-20.2R1.10-re-qemu.qcow2
APSTRA_SRV=$PWD/images/aos_server_3.3.0c-26.qcow2
APSTRA_ZTP=$PWD/images/apstra-ztp-2.0.0-60.qcow2
```
>>>

```
cd ..
./deploy.sh
```

### 0 configuration required for Virtual QFXes

```
system {
    root-authentication {
        encrypted-password "$6$L0OPCN3L$16YkZE7L0VDUdUEoJkNnhq2CE1/9AlLLETi.8aTmATd3Y1Wppp56bTr1LxRmFZG61lJTtvmVXypvJkABm96PI1"; ## SECRET-DATA
    }
    services {
        ssh;
        netconf {
            ssh;
        }
    }
    syslog {
        user * {
            any emergency;
        }
        file messages {
            any notice;
            authorization info;
        }
        file interactive-commands {
            interactive-commands any;
        }
    }
    extensions {
        providers {
            juniper {
                license-type juniper deployment-scope commercial;
            }
            chef {
                license-type juniper deployment-scope commercial;
            }
        }
    }
}
chassis {
    auto-image-upgrade;
}
interfaces {
    em0 {
        unit 0 {
            family inet {
                dhcp {
                    vendor-id Juniper-qfx10002-72q;
                }
            }
        }
    }
    em1 {
        unit 0 {
            family inet {
                address 169.254.0.2/24;
            }
        }
    }
}
forwarding-options {
    storm-control-profiles default {
        all;
    }
}
protocols {
    igmp-snooping {
        vlan default;
    }
}
vlans {
    default {
        vlan-id 1;
    }
}
```
