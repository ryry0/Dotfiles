"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "79bb70c2-8deb-43cf-ae79-38e5e584b88e" --type "headless"
start /b "xserver" "C:\Program Files (x86)\Xming\Xming.exe" :0 -clipboard -multiwindow
start /b bash -c "~/xaeth.sh; bash"
