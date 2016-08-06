IP        = 192.168.3.10
KS_FILE   = ks.cfg
FTP_DIR   = /var/ftp

BASE_DIR  = $(FTP_DIR)/$(DIST_NAME)
DIST_DIR  = $(FTP_DIR)/$(DIST_NAME)

REPO_NAME = repo
BASE_DIR  = $(FTP_DIR)/$(DIST_NAME)
REPO_DIR  = $(BASE_DIR)/$(REPO_NAME)
REPO_URL  = ftp://$(IP)/$(DIST_NAME)/$(REPO_NAME)
KS_URL    = ftp://$(IP)/$(DIST_NAME)/$(KS_FILE)

CENTOS_URL= http://releases.ubuntu.com/14.04/ubuntu-14.04.5-server-amd64.iso

CENTOS    = CentOS-7-x86_64-Minimal-1511.iso


dummy:

clean:
	rm *~

ip:
	$(IP)

$(CENTOS):
	wget $(CENTOS_URL)


install:
	cp vsftpd-anon.cfg /etc
	cp $(KS_FILE) $(DIST_DIR)  

run: install $(CENTOS)
	-mkdir -p $(REPO_DIR)
	-umount /var/ftp/$(DIST_NAME)/repo
	sudo mount -o loop ./$(CENTOS)  /var/ftp/$(DIST_NAME)/repo
	-killall vsftpd
	vsftpd /etc/vsftpd-anon.cfg &
	sudo pixiecore -debug -kernel /var/ftp/centos7/repo/isolinux/vmlinuz -initrd /var/ftp/centos7/repo/isolinux/initrd.img --cmdline "inst-repo=$(REPO_URL) ks=$(KS_URL)"

