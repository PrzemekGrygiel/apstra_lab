Login into vQFX shell and follow the procedure:

rm /etc/config/vqfx-10000-factory.conf /etc/config/vqfx-10000-factory.conf2
vi cp /etc/config/vqfx-10000-factory.conf 

Copy paste folowing configuration:
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

