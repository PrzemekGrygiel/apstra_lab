# VQFX ZTP SETUP GUIDE
## Pre-requisites
This guide is the procedure to enable support for Zero Touch Provisioning (ZTP) in vQFX switches.  This document presupposes that you have already deployed a vQFX switch.  Deployment of a vQFX switch is outside the scope of this document.
This document presupposes that CentOS 7.6 is the host operating system, and the KVM hypervisor used to host virtual machines.  The processes and configurations in this guide have not been tested with any other Linux distribution, or hypervisor. 

Because this is a test lab, the following guide presumes that you are logged into your test system as the root user.  If you are not, please make appropriate adjustments for file locations, and use of the sudo command.

### Login into vQFX shell 
Accessing the console of virtualized switches
To access the console of virtualized switches, run the command “virsh console [name]”, where “[name]” is replaced with the name of an individual switch.  For example, to access the switch “leaf4-re”, you would use the following command: 

```
virsh console [name of RE]
```
This should produce a console output that looks as follows:
```
root@node:~$ virsh console leaf4-re
Connected to domain leaf4-re
Escape character is ^]
{master:0}
root@vqfx> 
```

### Configuring the vQFX

1) Remove current existing factory default configuration file. 
The factory default configuration file for the vQFX must be deleted (not edited) because it is a symbolic link to a read only volume.  This must be done for each vQFX that you wish to have use ZTP.  From the vQFX shell of the relevant switch run the following command:


```
rm /etc/config/vqfx-10000-factory.conf 
```

2) Create new file
```
vi /etc/config/vqfx-10000-factory.conf 
```

3) Enter configuration file contents
As per the previous command, you should still have the /etc/config/vqfx-10000-factory.conf file open in the vi editor.  Copy the configuration code below into the configuration file (https://raw.githubusercontent.com/PrzemekGrygiel/apstra_lab/main/ztp_patch/ztp.patch):
```
system {
    host-name vqfx-factory;
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
    ## Warning: missing mandatory statement(s): 'root-authentication'
}
chassis {
    auto-image-upgrade;
}
interfaces {
    xe-0/0/0 {
        unit 0 {
            family inet;
        }
    }
    xe-0/0/1 {
        unit 0 {
            family inet;
        }
    }
    xe-0/0/2 {
        unit 0 {
            family inet;
        }
    }
    xe-0/0/3 {
        unit 0 {
            family inet;              
        }
    }
    xe-0/0/4 {
        unit 0 {
            family inet;
        }
    }
    xe-0/0/5 {
        unit 0 {
            family inet;
        }
    }
    xe-0/0/6 {
        unit 0 {
            family inet;
        }
    }
    xe-0/0/7 {
        unit 0 {
            family inet;
        }
    }
    xe-0/0/8 {
        unit 0 {
            family inet;
        }
    }
    xe-0/0/9 {
        unit 0 {
            family inet;
        }
    }
    xe-0/0/10 {
        unit 0 {
            family inet;
        }
    }
    xe-0/0/11 {                       
        unit 0 {
            family inet;
        }
    }
    em0 {
        unit 0 {
            family inet {
                dhcp {
                    vendor-id Juniper-vqfx-10000;
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
protocols {
    lldp {
        interface all;
    }
}
```

4) Exit the vi editor:
```
[esc] :wq

```

5) Zeroize the vQFX
Now that the switch’s configuration has been updated, it needs to be zeroized so that it will reach out to (and register with) the cloud management application.
```
request system zeroize
```

