IP        = 192.168.3.10
KS_FILE   = ubuntu-ks.cfg
PRE_FILE  = preseed.cfg
FTP_DIR   = /var/ftp

DIST_NAME = ubuntu1404
DIST_DIR  = $(FTP_DIR)/$(DIST_NAME)/

REPO_NAME = repo
BASE_DIR  = $(FTP_DIR)/$(DIST_NAME)
REPO_DIR  = $(BASE_DIR)/$(REPO_NAME)
#REPO_URL  = ftp://$(IP)/$(DIST_NAME)/$(REPO_NAME)
REPO_URL  = ftp://$(IP)/$(DIST_NAME)
KS_URL    = ftp://$(IP)//$(KS_FILE)
PRE_URL   = ftp://$(IP)//$(PRE_FILE)
UBUNTU_URL= http://releases.ubuntu.com/14.04/ubuntu-14.04.5-server-amd64.iso

UBUNTU    = ubuntu-14.04.5-server-amd64.iso
POST_SH   = run.sh


dummy:

clean:
	rm *~

$(UBUNTU):
	wget $(UBUNTU_URL)

install:
	cp vsftpd-anon.cfg /etc
	cp $(KS_FILE) $(BASE_DIR)  
	cp $(PRE_FILE) $(FTP_DIR)  
	cp $(POST_SH) $(FTP_DIR)  

run: $(UBUNTU) install
	-mkdir -p $(REPO_DIR)
	-umount /var/ftp/$(DIST_NAME)/repo
	mount -o loop ./$(UBUNTU)  /var/ftp/$(DIST_NAME)/repo
	-killall vsftpd
	vsftpd /etc/vsftpd-anon.cfg &
#	pixiecore -debug -kernel /var/ftp/$(DIST_NAME)/repo/install/netboot/ubuntu-installer/amd64/linux -initrd /var/ftp/$(DIST_NAME)/repo/install/netboot/ubuntu-installer/amd64/initrd.gz --cmdline "ks=$(KS_URL)"
	pixiecore -debug -kernel /var/ftp/$(DIST_NAME)/repo/install/netboot/ubuntu-installer/amd64/linux -initrd /var/ftp/$(DIST_NAME)/repo/install/netboot/ubuntu-installer/amd64/initrd.gz --cmdline "auto url=$(PRE_URL) DEBCONF_DEBUG=5 dbg/flags=all-x ramdisk_size=14984 locale=en_US.UTF-8 console-setup/ask_detect=false keyboard-configuration/layoutcode=es console-setup/layoutcode=string us hostname=unassigned-hostname domain=unassigned-domain"

