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
echo "[$NAME]\npath = $SHARE\nbrowseable = yes\nwritable = yes\ncomment = samba share\npublic = no" > /etc/samba/smb.conf
echo "Creating smb user.."
smbpasswd -a $USER
systemctl restart smbd
systemctl enable smbd
