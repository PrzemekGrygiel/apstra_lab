#!/bin/bash 

# images versions
VQFX_PFE=$PWD/images/vqfx-20.3R1-2019010209-pfe-qemu.qcow
VQFX_RE=$PWD/images/vqfx-20.3R1.8-re-qemu-ztp-ready.qcow
APSTRA_SRV=$PWD/images/aos_server_3.3.0c-26.qcow2
APSTRA_ZTP=$PWD/images/apstra-ztp-2.0.0-60.qcow2
LINUX_IMG=$PWD/images/CentOS-7-x86_64-GenericCloud.qcow2
VCENTER_IMG=$PWD/images/vcenter.qcow2
ESXI1_IMG=$PWD/images/esxi1.qcow2
ESXI2_IMG=$PWD/images/esxi2.qcow2
#TBD
# For the Transport Nodes, there is no special image
# The same image as ESXi has to be used and then the 
# nodes have to be configured with a transport-node profile
#TRANSPORT_NODE_IMG=$PWD/images/CentOS-7-x86_64-GenericCloud.qcow2
NSXT_MANAGER_IMG=$PWD/images/CentOS-7-x86_64-GenericCloud.qcow2

echo "Start cleaning old configuration "
virsh destroy spine1-re   
virsh destroy spine1-pfe  
virsh destroy spine2-re   
virsh destroy spine2-pfe  
virsh destroy leaf1-re    
virsh destroy leaf1-pfe   
virsh destroy leaf2-re    
virsh destroy leaf2-pfe   
virsh destroy leaf3-re    
virsh destroy leaf3-pfe   
virsh destroy leaf4-re    
virsh destroy leaf4-pfe
virsh destroy border-leaf1-re  
virsh destroy border-leaf1-pfe 
virsh destroy border-leaf2-re  
virsh destroy border-leaf2-pfe    
virsh destroy aos-ztp     
virsh destroy aos-srv
virsh destroy vcenter
virsh destroy bms1
virsh destroy bms2 
virsh destroy esxi1
virsh destroy esxi2
virsh destroy nsxt-manager 
virsh destroy transport-node

virsh undefine spine1-re   
virsh undefine spine1-pfe  
virsh undefine spine2-re   
virsh undefine spine2-pfe  
virsh undefine leaf1-re    
virsh undefine leaf1-pfe   
virsh undefine leaf2-re    
virsh undefine leaf2-pfe   
virsh undefine leaf3-re    
virsh undefine leaf3-pfe   
virsh undefine leaf4-re    
virsh undefine leaf4-pfe   
virsh undefine border-leaf1-re  
virsh undefine border-leaf1-pfe 
virsh undefine border-leaf2-re  
virsh undefine border-leaf2-pfe 
virsh undefine aos-ztp     
virsh undefine aos-srv     
virsh undefine vcenter
virsh undefine bms1
virsh undefine bms2 
virsh undefine esxi1
virsh undefine esxi2
virsh undefine nsxt-manager 
virsh undefine transport-node

ifconfig mgmt down
ifconfig spine1-int down
ifconfig spine2-int down
ifconfig leaf1-int down
ifconfig leaf2-int down
ifconfig leaf3-int down
ifconfig leaf4-int down
ifconfig bl1-int down
ifconfig bl2-int down
ifconfig leaf1-0 down
ifconfig leaf1-1 down
ifconfig leaf1-2 down
ifconfig leaf1-3 down
ifconfig leaf2-0 down
ifconfig leaf2-1 down
ifconfig leaf2-2 down
ifconfig leaf2-3 down
ifconfig leaf3-0 down
ifconfig leaf3-1 down
ifconfig leaf3-2 down
ifconfig leaf3-3 down
ifconfig leaf4-0 down
ifconfig leaf4-1 down
ifconfig leaf4-2 down
ifconfig leaf4-3 down
ifconfig leaf1-0 down
ifconfig leaf1-1 down
ifconfig border-leaf1-0 down
ifconfig border-leaf1-1 down
ifconfig border-leaf1-2 down
ifconfig border-leaf1-3 down
ifconfig border-leaf2-0 down
ifconfig border-leaf2-1 down
ifconfig border-leaf2-2 down
ifconfig border-leaf2-3 down
ifconfig s1-l1 down
ifconfig s1-l2 down
ifconfig s1-l3 down
ifconfig s1-l4 down
ifconfig s1-b1 down
ifconfig s1-b2 down
ifconfig s2-l1 down
ifconfig s2-l2 down
ifconfig s2-l3 down
ifconfig s2-l4 down
ifconfig s2-b1 down
ifconfig s2-b2 down
ifconfig s3-l1 down
ifconfig s3-l2 down
ifconfig s3-l3 down
ifconfig s3-l4 down
ifconfig s4-l1 down
ifconfig s4-l2 down
ifconfig s4-l3 down
ifconfig s4-l4 down

rm -rf /var/lib/libvirt/images/spine1-re.qcow2
rm -rf /var/lib/libvirt/images/spine1-pfe.qcow2
rm -rf /var/lib/libvirt/images/spine2-re.qcow2
rm -rf /var/lib/libvirt/images/spine2-pfe.qcow2
rm -rf /var/lib/libvirt/images/leaf1-re.qcow2
rm -rf /var/lib/libvirt/images/leaf1-pfe.qcow2
rm -rf /var/lib/libvirt/images/leaf2-re.qcow2
rm -rf /var/lib/libvirt/images/leaf2-pfe.qcow2
rm -rf /var/lib/libvirt/images/leaf3-re.qcow2
rm -rf /var/lib/libvirt/images/leaf3-pfe.qcow2
rm -rf /var/lib/libvirt/images/leaf4-re.qcow2
rm -rf /var/lib/libvirt/images/leaf4-pfe.qcow2
rm -rf /var/lib/libvirt/images/border-leaf1-pfe.qcow2
rm -rf /var/lib/libvirt/images/border-leaf1-re.qcow2
rm -rf /var/lib/libvirt/images/border-leaf2-pfe.qcow2
rm -rf /var/lib/libvirt/images/border-leaf2-re.qcow2
rm -rf /var/lib/libvirt/images/aos-srv.qcow2
rm -rf /var/lib/libvirt/images/aos-ztp.qcow2
rm -rf /var/lib/libvirt/images/vcenter.qcow2
rm -rf /var/lib/libvirt/images/bms1.qcow2
rm -rf /var/lib/libvirt/images/bms2.qcow2
rm -rf /var/lib/libvirt/images/bms1-config.iso 
rm -rf /var/lib/libvirt/images/bms2-config.iso 
rm -rf /var/lib/libvirt/images/esxi1.qcow2
rm -rf /var/lib/libvirt/images/esxi2.qcow2
rm -rf /var/lib/libvirt/images/esxi3.qcow2
rm -rf /var/lib/libvirt/images/transport-node.qcow2
rm -rf /var/lib/libvirt/images/nsxt_manager.qcow2

brctl delbr mgmt
brctl delbr spine1-int
brctl delbr spine2-int
brctl delbr leaf1-int
brctl delbr leaf2-int
brctl delbr leaf3-int
brctl delbr leaf4-int
brctl delbr bl1-int down
brctl delbr bl2-int down
brctl delbr leaf1-0
brctl delbr leaf1-1
brctl delbr leaf1-2
brctl delbr leaf1-3
brctl delbr leaf2-0
brctl delbr leaf2-1
brctl delbr leaf2-2
brctl delbr leaf2-3
brctl delbr leaf3-0
brctl delbr leaf3-1
brctl delbr leaf3-2
brctl delbr leaf3-3
brctl delbr leaf4-0
brctl delbr leaf4-1
brctl delbr leaf4-2
brctl delbr leaf4-3
brctl delbr border-leaf1-0 down
brctl delbr border-leaf1-1 down
brctl delbr border-leaf1-2 down
brctl delbr border-leaf1-3 down
brctl delbr border-leaf2-0 down
brctl delbr border-leaf2-1 down
brctl delbr border-leaf2-2 down
brctl delbr border-leaf2-3 down
brctl delbr s1-l1
brctl delbr s1-l2
brctl delbr s1-l3
brctl delbr s1-l4
brctl delbr s1-b1
brctl delbr s1-b2
brctl delbr s2-l1
brctl delbr s2-l2
brctl delbr s2-l3
brctl delbr s2-l4
brctl delbr s2-b1
brctl delbr s2-b2
brctl delbr s3-l1
brctl delbr s3-l2
brctl delbr s3-l3
brctl delbr s3-l4
brctl delbr s4-l1
brctl delbr s4-l2
brctl delbr s4-l3
brctl delbr s4-l4

echo "Stop cleaning old configuration "
sleep 1
echo "Start creating bridges"

brctl addbr mgmt
brctl addbr spine1-int
brctl addbr spine2-int
brctl addbr leaf1-int
brctl addbr leaf2-int
brctl addbr leaf3-int
brctl addbr leaf4-int
brctl addbr bl1-int 
brctl addbr bl2-int 
brctl addbr leaf1-0
brctl addbr leaf1-1
brctl addbr leaf1-2
brctl addbr leaf1-3
brctl addbr leaf2-0
brctl addbr leaf2-1
brctl addbr leaf2-2
brctl addbr leaf2-3
brctl addbr leaf3-0
brctl addbr leaf3-1
brctl addbr leaf3-2
brctl addbr leaf3-3
brctl addbr leaf4-0
brctl addbr leaf4-1
brctl addbr leaf4-2
brctl addbr leaf4-3
brctl addbr border-leaf1-0
brctl addbr border-leaf1-1
brctl addbr border-leaf1-2
brctl addbr border-leaf1-3
brctl addbr border-leaf2-0
brctl addbr border-leaf2-1
brctl addbr border-leaf2-2
brctl addbr border-leaf2-3
brctl addbr s1-l1
brctl addbr s1-l2
brctl addbr s1-l3
brctl addbr s1-l4
brctl addbr s1-b1
brctl addbr s1-b2
brctl addbr s2-l1
brctl addbr s2-l2
brctl addbr s2-l3
brctl addbr s2-l4
brctl addbr s2-b1
brctl addbr s2-b2
brctl addbr s3-l1
brctl addbr s3-l2
brctl addbr s3-l3
brctl addbr s3-l4
brctl addbr s4-l1
brctl addbr s4-l2
brctl addbr s4-l3
brctl addbr s4-l4

ifconfig mgmt up
ip a a 172.16.0.1/24 dev mgmt
ifconfig spine1-int  up
ifconfig spine2-int up
ifconfig leaf1-int up
ifconfig leaf2-int up
ifconfig leaf3-int up
ifconfig leaf4-int up
ifconfig bl1-int up
ifconfig bl2-int up
ifconfig leaf1-0 up
ifconfig leaf1-1 up
ifconfig leaf1-2 up
ifconfig leaf1-3 up
ifconfig leaf2-0 up
ifconfig leaf2-1 up
ifconfig leaf2-2 up
ifconfig leaf2-3 up
ifconfig leaf3-0 up
ifconfig leaf3-1 up
ifconfig leaf3-2 up
ifconfig leaf3-3 up
ifconfig leaf4-0 up
ifconfig leaf4-1 up
ifconfig leaf4-2 up
ifconfig leaf4-3 up
ifconfig border-leaf1-0 up
ifconfig border-leaf1-1 up
ifconfig border-leaf1-2 up
ifconfig border-leaf1-3 up
ifconfig border-leaf2-0 up
ifconfig border-leaf2-1 up
ifconfig border-leaf2-2 up
ifconfig border-leaf2-3 up
ifconfig s1-l1 up
ifconfig s1-l2 up
ifconfig s1-l3 up
ifconfig s1-l4 up
ifconfig s1-b1 up
ifconfig s1-b2 up
ifconfig s2-l1 up
ifconfig s2-l2 up
ifconfig s2-l3 up
ifconfig s2-l4 up
ifconfig s2-b1 up
ifconfig s2-b2 up
ifconfig s3-l1 up
ifconfig s3-l2 up
ifconfig s3-l3 up
ifconfig s3-l4 up
ifconfig s4-l1 up
ifconfig s4-l2 up
ifconfig s4-l3 up
ifconfig s4-l4 up

echo 16384 > /sys/class/net/s1-l1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s1-l2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s1-l3/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s1-l4/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s1-b1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s1-b2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l3/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l4/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-b1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-b2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s3-l1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s3-l2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s3-l3/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s3-l4/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s4-l1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s4-l2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s4-l3/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s4-l4/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s1-l1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s1-l2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s1-l3/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s1-l4/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l3/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l4/bridge/group_fwd_mask

echo "Stop creating bridges"

echo "Copy images"
cp -fn $VQFX_RE /var/lib/libvirt/images/spine1-re.qcow2
cp -fn $VQFX_PFE /var/lib/libvirt/images/spine1-pfe.qcow2
cp -fn $VQFX_RE  /var/lib/libvirt/images/spine2-re.qcow2
cp -fn $VQFX_PFE /var/lib/libvirt/images/spine2-pfe.qcow2
cp -fn $VQFX_RE  /var/lib/libvirt/images/leaf1-re.qcow2
cp -fn $VQFX_PFE /var/lib/libvirt/images/leaf1-pfe.qcow2
cp -fn $VQFX_RE /var/lib/libvirt/images/leaf2-re.qcow2
cp -fn $VQFX_PFE /var/lib/libvirt/images/leaf2-pfe.qcow2
cp -fn $VQFX_RE /var/lib/libvirt/images/leaf3-re.qcow2
cp -fn $VQFX_PFE /var/lib/libvirt/images/leaf3-pfe.qcow2
cp -fn $VQFX_RE /var/lib/libvirt/images/leaf4-re.qcow2
cp -fn $VQFX_PFE /var/lib/libvirt/images/leaf4-pfe.qcow2
cp -fn $VQFX_PFE /var/lib/libvirt/images/border-leaf1-pfe.qcow2
cp -fn $VQFX_RE /var/lib/libvirt/images/border-leaf1-re.qcow2
cp -fn $VQFX_PFE /var/lib/libvirt/images/border-leaf2-pfe.qcow2
cp -fn $VQFX_RE /var/lib/libvirt/images/border-leaf2-re.qcow2
cp -fn $APSTRA_SRV /var/lib/libvirt/images/aos-srv.qcow2
cp -fn $APSTRA_ZTP /var/lib/libvirt/images/aos-ztp.qcow2
cp -fn $LINUX_IMG /var/lib/libvirt/images
cp -fn $VCENTER_IMG /var/lib/libvirt/images/vcenter.qcow2
cp -fn $ESXI1_IMG /var/lib/libvirt/images/esxi1.qcow2
cp -fn $ESXI2_IMG /var/lib/libvirt/images/esxi2.qcow2
cp -fn $ESXI1_IMG /var/lib/libvirt/images/esxi3.qcow2
#cp -fn $TRANSPORT_NODE_IMG /var/lib/libvirt/images/transport-node.qcow2
cp -fn $NSXT_MANAGER_IMG /var/lib/libvirt/images/nsxt_manager.qcow2

echo "Copy images finished"
sleep 1
echo "Start install VMs"
qemu-img create -f qcow2 -o preallocation=metadata /var/lib/libvirt/images/bms1.qcow2 30G
qemu-img create -f qcow2 -o preallocation=metadata /var/lib/libvirt/images/bms2.qcow2 30G
virt-resize --expand /dev/sda1 /var/lib/libvirt/images/CentOS-7-x86_64-GenericCloud.qcow2 /var/lib/libvirt/images/bms1.qcow2
virt-resize --expand /dev/sda1 /var/lib/libvirt/images/CentOS-7-x86_64-GenericCloud.qcow2 /var/lib/libvirt/images/bms2.qcow2
genisoimage -output /var/lib/libvirt/images/bms1-config.iso -volid cidata -joliet -r servers/compute1/user-data servers/compute1/meta-data servers/compute1/network-config
genisoimage -output /var/lib/libvirt/images/bms2-config.iso -volid cidata -joliet -r servers/compute2/user-data servers/compute2/meta-data servers/compute2/network-config

virt-install --import --name bms1 --ram 8096 --vcpus 4 --disk \
    /var/lib/libvirt/images/bms1.qcow2,format=qcow2,bus=virtio --disk /var/lib/libvirt/images/bms1-config.iso,device=cdrom --network \
    bridge=mgmt,model=virtio --network bridge=leaf1-0,model=virtio --network bridge=leaf2-0,model=virtio --os-type=linux --os-variant=rhel7 --noautoco
    --accelerate

virt-install --import --name bms2 --ram 8096 --vcpus 4 --disk \
    /var/lib/libvirt/images/bms2.qcow2,format=qcow2,bus=virtio --disk /var/lib/libvirt/images/bms2-config.iso,device=cdrom --network \
    bridge=mgmt,model=virtio --network bridge=leaf3-0,model=virtio --network bridge=leaf4-0,model=virtio --os-type=linux --os-variant=rhel7 --noautoconsole --noapic \
    --accelerate

virt-install \
    --name spine1-re \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/spine1-re.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=spine1-int,model=e1000 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=s1-l1,model=e1000 \
    --network bridge=s1-l2,model=e1000 \
    --network bridge=s1-l3,model=e1000 \
    --network bridge=s1-l4,model=e1000 \
    --noautoconsole

virt-install \
    --name spine1-pfe \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/spine1-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=spine1-int,model=e1000 \
    --noautoconsole

virt-install \
    --name spine2-re \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/spine2-re.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=spine2-int,model=e1000 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=s2-l1,model=e1000 \
    --network bridge=s2-l2,model=e1000 \
    --network bridge=s2-l3,model=e1000 \
    --network bridge=s2-l4,model=e1000 \
    --noautoconsole

virt-install \
    --name spine2-pfe \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/spine2-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=spine2-int,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf1-re \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/leaf1-re.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf1-int,model=e1000 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=s1-l1,model=e1000 \
    --network bridge=s2-l1,model=e1000 \
    --network bridge=leaf1-0,model=e1000 \
    --network bridge=leaf1-1,model=e1000 \
    --network bridge=leaf1-2,model=e1000 \
    --network bridge=leaf1-3,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf1-pfe \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/leaf1-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf1-int,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf2-re \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/leaf2-re.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf2-int,model=e1000 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=s1-l2,model=e1000 \
    --network bridge=s2-l2,model=e1000 \
    --network bridge=leaf2-0,model=e1000 \
    --network bridge=leaf2-1,model=e1000 \
    --network bridge=leaf2-2,model=e1000 \
    --network bridge=leaf2-3,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf2-pfe \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/leaf2-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf2-int,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf3-re \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/leaf3-re.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf3-int,model=e1000 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=s1-l3,model=e1000 \
    --network bridge=s2-l3,model=e1000 \
    --network bridge=leaf3-0,model=e1000 \
    --network bridge=leaf3-1,model=e1000 \
    --network bridge=leaf3-2,model=e1000 \
    --network bridge=leaf3-3,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf3-pfe \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/leaf3-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf3-int,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf4-re \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/leaf4-re.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf4-int,model=e1000 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=s1-l4,model=e1000 \
    --network bridge=s2-l4,model=e1000 \
    --network bridge=leaf4-0,model=e1000 \
    --network bridge=leaf4-1,model=e1000 \
    --network bridge=leaf4-2,model=e1000 \
    --network bridge=leaf4-3,model=e1000 \
    --noautoconsole

virt-install \
    --name border-leaf1-re \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/border-leaf1-re.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=bl1-int,model=e1000 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=s1-b1,model=e1000 \
    --network bridge=s2-b1,model=e1000 \
    --network bridge=border-leaf1-0,model=e1000 \
    --network bridge=border-leaf1-1,model=e1000 \
    --network bridge=border-leaf1-2,model=e1000 \
    --network bridge=border-leaf1-3,model=e1000 \
    --noautoconsole

virt-install \
    --name border-leaf2-pfe \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/border-leaf2-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=bl2-int,model=e1000 \
    --noautoconsole

virt-install \
    --name border-leaf2-re \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/border-leaf2-re.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=bl2-int,model=e1000 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=s1-b2,model=e1000 \
    --network bridge=s2-b2,model=e1000 \
    --network bridge=border-leaf2-0,model=e1000 \
    --network bridge=border-leaf2-1,model=e1000 \
    --network bridge=border-leaf2-2,model=e1000 \
    --network bridge=border-leaf2-3,model=e1000 \
    --noautoconsole

virt-install \
    --name border-leaf1-pfe \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/border-leaf1-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=bl1-int,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf4-pfe \
    --memory 2048 \
    --vcpus=2 \
    --import \
    --disk /var/lib/libvirt/images/leaf4-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf4-int,model=e1000 \
    --noautoconsole

virt-install \
    --name aos-srv \
    --memory 32768 \
    --vcpus=8 \
    --import \
    --disk /var/lib/libvirt/images/aos-srv.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --noautoconsole

virt-install \
    --name aos-ztp \
    --memory 16384 \
    --vcpus=4 \
    --import \
    --disk /var/lib/libvirt/images/aos-ztp.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --noautoconsole

virt-install --import --name vcenter --ram 16384 --vcpus 4 --disk \
    /var/lib/libvirt/images/vcenter.qcow2,format=qcow2,bus=virtio --network \
    bridge=mgmt,model=virtio --os-type=linux  --noautoconsole --noapic \
    --accelerate


virt-install --import --name nsxt-manager --ram 16384 --vcpus 4 --disk \
    /var/lib/libvirt/images/nsxt_manager.qcow2,format=qcow2,bus=virtio --network \
    bridge=mgmt,model=virtio --os-type=linux  --noautoconsole --noapic \
    --accelerate

virt-install --import --name esxi1 --ram 16384 --vcpus 4 --disk \
    /var/lib/libvirt/images/esxi1.qcow2,format=qcow2,bus=virtio --network \
    bridge=mgmt,model=virtio --network bridge=leaf1-1,model=virtio --network bridge=leaf2-1,model=virtio --os-type=linux  --noautoconsole --noapic \
    --accelerate

virt-install --import --name esxi2 --ram 16384 --vcpus 4 --disk \
    /var/lib/libvirt/images/esxi2.qcow2,format=qcow2,bus=virtio --network \
    bridge=mgmt,model=virtio --network bridge=leaf3-1,model=virtio --network bridge=leaf4-1,model=virtio --os-type=linux  --noautoconsole --noapic \
    --accelerate

virt-install --import --name transport-node --ram 16384 --vcpus 4 --disk \
    /var/lib/libvirt/images/esxi3.qcow2,format=qcow2,bus=virtio --network \
    bridge=mgmt,model=virtio --network bridge=border-leaf1-0,model=virtio --network bridge=border-leaf2-0,model=virtio --os-type=linux  --noautoconsole --noapic \
    --accelerate


    echo "Stop install VMs"
    echo "Done ..."
