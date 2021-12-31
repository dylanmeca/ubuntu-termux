#!/data/data/com.termux/files/usr/bin/bash
mkdir -p $PREFIX/share/Ubuntu
cd $PREFIX/share/Ubuntu
folder=ubuntu-fs
if [ -d "$folder" ]; then
	first=1
	echo -e "\n\e[1;31m [*] Skipping Downloading"
fi
tarball="ubuntu-rootfs.tar.gz"
if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
		echo -e "\n\e[1;34m [*] Download Rootfs, this may take a while base on your internet speed"
		case `dpkg --print-architecture` in
		aarch64)
			archurl="arm64" ;;
		arm)
			archurl="armhf" ;;
		amd64)
			archurl="amd64" ;;
		x86_64)
			archurl="amd64" ;;	
		*)
			echo -e "\n\e[1;34m [*] Unknown Architecture"; exit 1 ;;
		esac
		wget "http://cdimage.ubuntu.com/ubuntu-base/releases/20.04/release/ubuntu-base-20.04.3-base-${archurl}.tar.gz" -O $tarball
	fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
	echo -e "\n\e[1;34m [*] Decompressing Rootfs, please be patient."
	proot --link2symlink tar -xf ${cur}/${tarball}||:
	cd "$cur"
fi
mkdir -p ubuntu-binds
bin=ubuntu
echo -e "\n\e[1;34m [*] Configuring Ubuntu..."
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A ubuntu-binds)" ]; then
    for f in ubuntu-binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b ubuntu-fs/root:/dev/shm"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

termux-fix-shebang $bin
chmod +x $bin
mv $bin $PREFIX/bin
rm -rf $tarball
echo -e "\n\e[1;34m [*] The installation is finished"
echo -e "\n\e[1;34m [*] Start Ubuntu 20.04 with the command: ${ubuntu}" 
