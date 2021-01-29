**This is the procedure to force vQFX properly run with ZTP**

Login into vQFX shell 
```
virsh console [name of RE]
```
e.g.
```
buntu@5a4s1-node3:~$ virsh console leaf4-re
Connected to domain leaf4-re
Escape character is ^]


{master:0}
root@vqfx> 
```

and follow steps:

1. Remove current existing factory default configuration file. I must be deleted not edited due it is symbolic link to Read Only volumen.

```
rm /etc/config/vqfx-10000-factory.conf 
```
Create new file (automatily with write permision)

```
vi /etc/config/vqfx-10000-factory.conf 
```

Copy paste folowing configuration into vqfx-10000-factory.conf file:
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

Exit from shel and now you can zeroize the switch 

```
request system zeroize
```

