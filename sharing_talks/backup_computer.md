backup computer
========================================================
author: yingying
date: 2019.01.14
autosize: true

What is a computer backup
========================================================

- Copies of the original files that you have on your laptop
- Making backups is much easier and less expensive than trying to recover files from a broken hard drive.
- All hard drives will eventually fail; it’s just a question of when and whether or not you’ll be prepared.


Three kinds of backup
========================================================

- A Bootable Backup (or “Clone”)
A clone is a complete copy of your computer’s primary hard drive (sometimes called a "boot drive"). If your computer’s primary drive died tomorrow you could hook up the clone, reboot your computer from it, and have immediate access to not only all of your files but also all of the software you use, including all of the settings and configuration changes that you have made.

- External Backup Drive
You can also use an external hard drive to create an archive of your changed and deleted files. An archive is different from a clone in a few ways: first, it isn’t meant to be a bootable backup; second, it isn’t limited to a "snapshot" of your entire drive at one point in time. Instead, it creates incremental backups, which keep up with you as you work.

- Cloud Backup
In fact, cloud backups are the easiest kind to create and maintain. To get started you simply need to create an account, download software, run it once to enter your account information, and (optionally) set any preferences that you might want. After the initial setup you don’t need to do anything, the software will automatically keep your computer backed up any time it is turned on and connected to the Internet.

Why not use thumb drives? 
========================================================

- They are usually very small and often are not very dense, typically a thumb drive will not be able to hold all of the data that is on your computer.

****

- A good backup system should automatically perform incremental backups so you don't have to think about it or remember to do anything about it once the system is set up.
- Incremental means that successive backups use previous backups and the rsync delta-transfer algorithm in order to save space.
Automatically backup using external hard drive with external hard drive using crontab

Create Snapshots 

========================================================


```bash
#!/bin/bash
DIR="/media/usr/Elements/"
DATE=$(date +"%Y-%m")
BKP_FILE="$DIR/home-backup-$DATE.tar.gz"
BKP_DIRS="/home/usr/{Desktop,Documents,.mozilla,.config}"
echo tar --listed-incremental=$DIR/snapshot.file -cJpf $BKP_FILE $BKP_DIRS
```
and then add this line below to your crontab

```bash
00 00 * * *     /path/to/backup.sh 2>&1 >> /var/log/backup.log
```


Install Dropbox uploader
=========================================================


```bash
git clone https://github.com/andreafabrizi/Dropbox-Uploader.git
cd Dropbox-Uploader
sudo chmod +x *.sh
./dropbox_uploader.sh
```

Set up dropbox
============================================================


![create dropbox app](./sharing_talks/backup_computer-figure/figures/automatic-backup-create-dropbox-app.jpg)

****
Log into Dropbox and head over to this page. In order for this script to work, an access token needs to be created. Go here and click “create.” On the next page fill out all of the information to create your app. When prompted, click “Dropbox API.”


https://www.maketecheasier.com/set-up-backup-system-linux-dropbox/

Set up dropbox
==============================================================
![create dropbox app](./sharing_talks/backup_computer-figure/figures/automatic-backup-uploader-sh.png)


********
When all the information is filled out, you will have created your Dropbox app. The next step is to generate your access token. Look for it on the page, click the “Generate token,” and copy it to your clipboard.
Take the token and paste it into the terminal where the script prompts “access token.” With the access token added, make the backup directory.


```bash
./dropbox_uploader.sh mkdir my-backups
```

Automatically backup using dropbox with simple script and crontab
========================================================

```bash
#!/bin/bash
TMP_DIR="/tmp/"
DATE=$(date +"%d-%m-%Y_%H%M")
BKP_FILE="$TMP_DIR/MyBkp_$DATE.tar"
BKP_DIRS="/home/user /var/www /etc"
DROPBOX_UPLOADER=/path/to/dropbox_uploader.sh
tar cf "$BKP_FILE" $BKP_DIRS
gzip "$BKP_FILE"
$DROPBOX_UPLOADER -f /root/.dropbox_uploader upload "$BKP_FILE.gz" /
rm -fr "$BKP_FILE.gz"
```

and then add this line below to your crontab
========================================================


```bash
crontab -e
```


```bash
00 00 * * *     /path/to/backup.sh 2>&1 >> /var/log/backup.log
```
The script will be executed every night at midnight, and the logs will be stored in /var/log/backup.log

Using the Tivoli Storage Manager (TSM) Client Command Line Interface for Backup & Restore
=========================================================

Run dsmc as root from the shell prompt 

```bash
# start TSM
sudo dsmc
# and type
incr
# to look into your backup node
query backup "/yourDomainDirectory/*"
```
ref: https://help.it.ox.ac.uk/hfs/help/dsmc


rsync
========================================================
- Rsync is a fast, versatile, remote (and local) file-copying tool. It is famous for its delta-transfer algorithm, which reduces the amount of data sent over the network by sending only the differences between the source files and the existing files in the destination.
- It is available on most Unix-like systems, including the Odyssey cluster and Mac OS X.
- The basic syntax is: rsync SOURCE DESTINATION where SOURCE and DESTINATION are filesystem paths.
- They can be local, either absolute or relative to the current working directory, or they can be remote but prefixing something like USERNAME@HOSTNAME: to the front of them.

rdiff-backup
===========================================================
- The rdiff-backup software automatically preserves file attributes and all the other things (and more) that rsync's -a does.
- The syntax is like that of rsync, except two colons are used to separate the username/hostname and the path (instead of one) and trailing slashes on paths are not significant.


```bash
rdiff-backup /some/path /some/path-backup
# backup a remote machine instead of the localhost:
rdiff-backup /some/path USERNAME@HOSTNAME::/some/path-backup
```

reference
===========================================================

```bash
https://linuxconfig.org/keep-your-home-safe-with-cron-backups
https://www.unixmen.com/performing-incremental-backups-using-tar/
https://www.rc.fas.harvard.edu/resources/documentation/linux/rdiff-backup/
https://www.rc.fas.harvard.edu/resources/documentation/linux/rsync/
```
