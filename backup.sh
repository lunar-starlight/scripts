#!/bin/sh

systemd-run -S --user -p CPUWeight=idle -p IOWeight=1

XDG_CONFIG_HOME="$HOME/.config"
BACKUP_DIR=/mnt/ptuj/backup
BACKUP_CONF="$XDG_CONFIG_HOME"/to-backup.txt

mount /mnt/ptuj

while read p; do
	mkdir -p "$BACKUP_DIR$p"
	rsync -a --delete --quiet "$p"/* "$BACKUP_DIR$p"
done <$BACKUP_CONF

umount /mnt/ptuj

