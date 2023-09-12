cd /home/farm    
git pull origin main
git status
systemctl disable farm && systemctl stop farm
reboot
/usr/local/bin/gunicorn --chdir /home/farm main:app --bind 0.0.0.0
systemctl status farm
echo 'Deployment successful to digital ocean' 