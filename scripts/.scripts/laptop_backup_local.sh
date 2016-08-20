
#!/bin/bash

START=$(date +%s)
#rsync -avz -e --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found/*","/home/msjche/Downloads/*","/home/msjche/Dropbox/*","/home/msjche/Google\ Drive/","/home/msjche/MEGA"} ssh msjche@192.168.1.7:/media/Backup/Laptop /*

#rsync -aAXv --exclude={"/home/archie/coding/*","/lost+found", "/home/archie/git/*", "/home/archie/Desktop/*","/home/archie/Documents/*","/home/archie/Downloads/*","/home/archie/Dropbox/*","/home/archie/vmware/*","/home/archie/.cache/*","/home/archie/.cargo/*","/home/archie/.dropbox*","/home/archie/.emacs.d/*","/home/archie/.kde*","/home/archie/.npm*","/home/archie/vim*","/home/archie/.vmware/*", "/home/archie/.cache/*"} /home/archie/  /home/archie/Backup

#rsync -aAXv  --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/home/archie/coding/*","/lost+found", "/home/archie/git/*", "/home/archie/Desktop/*","/home/archie/Documents/*","/home/archie/Downloads/*","/home/archie/Dropbox/*","/home/archie/vmware/*","/home/archie/.cache/*","/home/archie/.cargo/*","/home/archie/.dropbox*","/home/archie/.emacs.d/*","/home/archie/.kde*","/home/archie/.npm*","/home/archie/vim*","/home/archie/.vmware/*" } /* /home/archie/Backup

rsync -aAXv /* /home/shwsun/backup  --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/lost+found,/var/*,/home/shwsun/Downloads/*,/home/shwsun/.vagrant.d/*,/home/shwsun/.cache/*./home/shwsun/VirtualBox\ VMs/*}

FINISH=$(date +%s)
echo "total time: $(( ($FINISH-$START) / 60 )) minutes, $(( ($FINISH-$START) % 60 )) seconds" | tee $1/"Backup from $(date "+%Y-%m-%d, %T, %A")"
