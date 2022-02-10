echo "Run make distclean"
make distclean

echo "Copy current kernel config."
cp /boot/config-$(uname -r) .config

echo "Make oldconfig (accept defaults)"
yes '' | make oldconfig > /dev/null

echo "Disable debug info in build"
scripts/config --disable DEBUG_INFO

echo "Set distcc hosts"
export DISTCC_HOSTS="localhost venus"

echo "Build"
make CC="ccache distcc gcc" -j $(getconf _NPROCESSORS_ONLN) deb-pkg LOCALVERSION=-ab-stable
