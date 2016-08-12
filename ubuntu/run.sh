sed -i '/PermitRootLogin / s/ .*/ yes/' /etc/ssh/sshd_config; 
cd /root
mkdir --mode=700 .ssh
cat >> .ssh/authorized_keys << "PUBLIC_KEY"
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxcTpQf3FMTz1SvFNWHqWXzzUuw+fjQu6AFvJJZ0Y6yWgrJnoxhodmpLsJQrQon94jOpBWLWyzKNxyorSGa66TquKGMuUDmv2DLYk/mAsnkUYvEXAWD9RyJtx1i6YDA3aYoUwF6CyZYDbMaR/hYmdRXVsOELNtRyJsRaUtpKJkouW7ifGyOoEySGBnvpa3JKZ7Ic0UBmSs4Vsk5TCuBLoyoKZ+8H1+VSPZDLbbMXBxVa4aHLHAj6832QopZtuB9zweQw5HlehowzFl1zgTRDdedRqns66asbJEJuANP+0kButf7VALYE5Ps+iEVdBOWXRyv1H3b0XoXOEcsWUm9vSd /home/cisco/.ssh/id_rsa
PUBLIC_KEY
chmod 600 .ssh/authorized_keys
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
apt-get install -y ansible emacs24-nox git ntpdate
ntpdate 0.pool.ntp.org;/sbin/hwclock -w
cd /home/cisco
mkdir --mode=700 .ssh
cat >> .ssh/authorized_keys << "PUBLIC_KEY"
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxcTpQf3FMTz1SvFNWHqWXzzUuw+fjQu6AFvJJZ0Y6yWgrJnoxhodmpLsJQrQon94jOpBWLWyzKNxyorSGa66TquKGMuUDmv2DLYk/mAsnkUYvEXAWD9RyJtx1i6YDA3aYoUwF6CyZYDbMaR/hYmdRXVsOELNtRyJsRaUtpKJkouW7ifGyOoEySGBnvpa3JKZ7Ic0UBmSs4Vsk5TCuBLoyoKZ+8H1+VSPZDLbbMXBxVa4aHLHAj6832QopZtuB9zweQw5HlehowzFl1zgTRDdedRqns66asbJEJuANP+0kButf7VALYE5Ps+iEVdBOWXRyv1H3b0XoXOEcsWUm9vSd /home/cisco/.ssh/id_rsa
PUBLIC_KEY
chmod 600 .ssh/authorized_keys
chown -R cisco.cisco /home/cisco
echo "cisco ALL = (root) NOPASSWD:ALL" > /etc/sudoers.d/ceph
ntpdate 0.pool.ntp.org
/sbin/hwclock -w
