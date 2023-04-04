#!/bin/bash
# This script will run into container

# source the common variables

. imx-5.10.72-2.2.0/env.sh

#

mkdir -p ${YOCTO_DIR}
cd ${YOCTO_DIR}

git config --global url."https://github.com/nxp-imx/uboot-imx".insteadOf https://source.codeaurora.org/external/imx/uboot-imx.git

# Init

repo init \
    -u ${REMOTE} \
    -b ${BRANCH} \
    -m ${MANIFEST}

repo sync -j16

# source the yocto env

EULA=1 MACHINE="${MACHINE}" DISTRO="${DISTRO}" source imx-setup-release.sh -b build_${DISTRO}

# Build

bitbake ${IMAGES}

