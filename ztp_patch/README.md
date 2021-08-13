Description
This is the patch to fix switch inventory replacing "chassis-inventory" by "system-information" to get proper hardware model.

Usage

Copy patch to ZTP server int directory "/containers_data/tftp"

scp ztp.patch admin@172.16.0.201:   #<- yours ZTP server IP here
sudo su
cp ztp.patch /containers_data/tftp
Login to Apstra ZTP server and go to directory with ztp.py

cd /containers_data/tftp
Alternativly to copy file using scp you can copy paste it

vi /containers_data/tftp/ztp.patch
and copy paste from https://raw.githubusercontent.com/PrzemekGrygiel/apstra_lab/main/ztp_patch/ztp.patch

Apply the patch

patch < ztp.patch
