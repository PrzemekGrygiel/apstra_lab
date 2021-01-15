#!/bin/bash

VQFX_PFE=$PWD/images/vqfx-20.2R1-2019010209-pfe-qemu.qcow2
VQFX_RE=$PWD/images/vqfx-20.2R1.10-re-qemu.qcow2
APSTRA_SRV=$PWD/images/aos_server_3.3.0c-26.qcow2
#TBC
APSTRA_ZTP=$PWD/images/aos_server_3.3.0c-26.qcow2

brctl addbr mgmt
brctl addbr spine1-int
brctl addbr spine2-int
brctl addbr leaf1-int
brctl addbr leaf2-int
brctl addbr leaf3-int
brctl addbr leaf4-int
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
brctl addbr s1-l1
brctl addbr s1-l2
brctl addbr s1-l3
brctl addbr s1-l4
brctl addbr s2-l1
brctl addbr s2-l2
brctl addbr s2-l3
brctl addbr s2-l4
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
ifconfig s1-l1 up
ifconfig s1-l2 up
ifconfig s1-l3 up
ifconfig s1-l4 up
ifconfig s2-l1 up
ifconfig s2-l2 up
ifconfig s2-l3 up
ifconfig s2-l4 up
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
echo 16384 > /sys/class/net/s2-l1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l3/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s2-l4/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s3-l1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s3-l2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s3-l3/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s3-l4/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s4-l1/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s4-l2/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s4-l3/bridge/group_fwd_mask
echo 16384 > /sys/class/net/s4-l4/bridge/group_fwd_mask

cp $VQFX_RE /var/lib/libvirt/images/spine1-re.qcow2
cp $VQFX_PFE /var/lib/libvirt/images/spine1-pfe.qcow2

cp $VQFX_RE  /var/lib/libvirt/images/spine2-re.qcow2
cp $VQFX_PFE /var/lib/libvirt/images/spine2-pfe.qcow2

cp $VQFX_RE  /var/lib/libvirt/images/leaf1-re.qcow2
cp $VQFX_PFE /var/lib/libvirt/images/leaf1-pfe.qcow2

cp $VQFX_RE /var/lib/libvirt/images/leaf2-re.qcow2
cp $VQFX_PFE /var/lib/libvirt/images/leaf2-pfe.qcow2

cp $VQFX_RE /var/lib/libvirt/images/leaf3-re.qcow2
cp $VQFX_PFE /var/lib/libvirt/images/leaf3-pfe.qcow2

cp $VQFX_RE /var/lib/libvirt/images/leaf4-re.qcow2
cp $VQFX_PFE /var/lib/libvirt/images/leaf4-pfe.qcow2

cp $APSTRA_SRV /var/lib/libvirt/images/apstra-srv.qcow2
cp $APSTRA_ZTP /var/lib/libvirt/images/apstra-ztp.qcow2

virt-install \
    --name spine1-re \
    --memory 1024 \
    --vcpus=1 \
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
    --vcpus=1 \
    --import \
    --disk /var/lib/libvirt/images/spine1-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=spine1-int,model=e1000 \
    --noautoconsole

virt-install \
    --name spine2-re \
    --memory 1024 \
    --vcpus=1 \
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
    --vcpus=1 \
    --import \
    --disk /var/lib/libvirt/images/spine2-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=spine2-int,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf1-re \
    --memory 1024 \
    --vcpus=1 \
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
    --vcpus=1 \
    --import \
    --disk /var/lib/libvirt/images/leaf1-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf1-int,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf2-re \
    --memory 1024 \
    --vcpus=1 \
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
    --vcpus=1 \
    --import \
    --disk /var/lib/libvirt/images/leaf2-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf2-int,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf3-re \
    --memory 1024 \
    --vcpus=1 \
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
    --vcpus=1 \
    --import \
    --disk /var/lib/libvirt/images/leaf3-pfe.qcow2,bus=ide,format=qcow2 \
    --network bridge=mgmt,model=e1000 \
    --network bridge=leaf3-int,model=e1000 \
    --noautoconsole

virt-install \
    --name leaf4-re \
    --memory 1024 \
    --vcpus=1 \
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
    --name leaf4-pfe \
    --memory 2048 \
    --vcpus=1 \
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