cd /home/farm    
git pull
git status
systemctl disable farm && systemctl stop farm
systemctl restart farm
systemctl status farm
echo 'Deployment successful to digital ocean' 