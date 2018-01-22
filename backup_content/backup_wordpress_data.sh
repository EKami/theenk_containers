cd /root/backup_content
git pull
git add -A
git commit -m "Backup commit on $(date)"
git push
