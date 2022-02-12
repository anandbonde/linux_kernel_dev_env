set -e

echo "cleaning"
make clean
make distclean
git clean -fdx

echo "configuring"
cp /boot/config-$(uname -r) .config
yes "" | make LSMOD="/tmp/my-lsmod" localmodconfig

echo "disabling unnecessary config"
scripts/config --disable DEBUG_INFO
scripts/config --disable SYSTEM_TRUSTED_KEYS
scripts/config --set-str CONFIG_SYSTEM_REVOCATION_KEYS ""

echo "setting env"
export DISTCC_HOSTS="localhost"

echo "building"
make CC="ccache distcc gcc" -j $(nproc) deb-pkg LOCALVERSION=-ab-stable

echo "installing"
cd ..
sudo dpkg -i *deb

echo "ready to reboot now"
