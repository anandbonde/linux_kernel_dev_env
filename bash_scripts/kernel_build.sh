echo "Run distclean"
make distclean

echo "Copy current kernel config."
cp /boot/config-$(uname -r) .config

echo "Make oldconfig, accept defaults"
yes '' | make oldconfig

echo "Set distcc hosts"
export DISTCC_HOSTS="localhost mercury"


echo "Build"
make CC="ccache distcc gcc" -j 4 deb-pkg LOCALVERSION=-ab-stable
