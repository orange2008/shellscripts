#!/bin/sh
echo "Share folder:"
read SHARE
echo "Share name:"
read NAME
echo "SMB user(must exists, recommended 'root' or 'ubuntu'):"
read USER
echo "Installing SAMBA.."
apt install samba smbclient -y
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
echo "Installing NANO for editing.."
apt install nano -y
mkdir -p $SHARE
chmod 777 $SHARE
echo "Please copy the following code."
echo "[$NAME]"
echo "    path = $SHARE"
echo "    browseable = yes"
echo "    writable = yes"
echo "    comment = smb share"
echo "    public = no"
echo "------------------"
echo "When you copied, press enter to open the configuration file."
echo "You'll need to copy these code to the end of the file."
read OK
nano /etc/samba/smb.conf
echo "Creating smb user.."
smbpasswd -a $USER
systemctl restart smbd
systemctl enable smbd
