This repository contains the config., automation scripts, docs. and recipes for
my linux kernel development workflow.

Scripts:

- setup.sh

	general setup for bash, vim etc.

- ansible (playbooks)

	refer to README.txt in the ansible folder

- kernel_source_operations

	- get_stable_kernel_source.sh

		gets kernel source for the stable branch, you may have to switch to latest
		kernel branch (e.g. git checkout linux-5.16.y)

	- kernel_build_distributed.sh

		builds kernel for debian (deb pkg) and installs them; this script uses
		multiple nodes (if configured) for a faster/distributed build

