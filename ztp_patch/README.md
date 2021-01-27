*Description*

This is the patch to fix switch inventory
replacing "chassis-inventory" by "system-information"
to get proper hardware model.

*Usage*

Copy patch to ZTP server int directory "/containers_data/tftp"

```
scp ztp.patch admin@[server ip]:
sudo su
cp ztp.patch /containers_data/tftp
```
Go to directory with ztp.py

```
cd /containers_data/tftp
```

Apply the patch

```
patch < ztp.patch
```
