IP        = 192.168.3.1
KS_FILE   = ks.cfg
FTP_DIR   = /var/ftp

BASE_DIR  = $(FTP_DIR)/$(DIST_NAME)
DIST_DIR  = $(FTP_DIR)/$(DIST_NAME)

REPO_NAME = repo
BASE_DIR  = $(FTP_DIR)/$(DIST_NAME)
REPO_DIR  = $(BASE_DIR)/$(REPO_NAME)
REPO_URL  = ftp://$(IP)/$(DIST_NAME)/$(REPO_NAME)
KS_URL    = ftp://$(IP)/$(DIST_NAME)/$(KS_FILE)

CENTOS_URL= http://mirrors.usc.edu/pub/linux/distributions/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso

CENTOS    = CentOS-7-x86_64-Minimal-1611.iso


dummy:

clean:
	rm *~


$(CENTOS):
	wget $(CENTOS_URL)


install:
	sudo apt-get install -y apt-transport-https
	curl -L https://packagecloud.io/danderson/pixiecore/gpgkey | sudo apt-key add -
	echo "deb https://packagecloud.io/danderson/pixiecore/debian stretch main" | sudo tee /etc/apt/sources.list.d/pixiecore.list
	sudo apt-get update
	sudo apt-get install pixiecore
	sudo mkdir -p $(BASE_DIR)
	sudo mkdir -p $(REPO_DIR)
	sudo apt-get install -y vsftpd
	sudo cp $(KS_FILE) $(DIST_DIR)  

run: $(CENTOS)
	-sudo umount /var/ftp/$(DIST_NAME)/repo
	sudo mount -o loop ./$(CENTOS)  /var/ftp/$(DIST_NAME)/repo
	-killall vsftpd
	vsftpd ./vsftpd-anon.cfg &
	sudo pixiecore -debug -listen-addr $(IP) -kernel $(REPO_DIR)/isolinux/vmlinuz -initrd $(REPO_DIR)/isolinux/initrd.img --cmdline "inst-repo=$(REPO_URL) ks=$(KS_URL)"

