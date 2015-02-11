#!/bin/bash

#
# Build U-Boot image when `mkimage' tool is available.
#

MKIMAGE=$(type -path "${CROSS_COMPILE}mkimage")

if [ -z "${MKIMAGE}" ]; then
	MKIMAGE=$(type -path mkimage)
	if [ -z "${MKIMAGE}" ]; then
		# Doesn't exist
		echo '"mkimage" command not found - U-Boot images will not be built' >&2
		exit 1;
	fi
fi

#hard code append imx6q-sabresd-ldo.dtb when we call mkimage to build uImage
echo "cat arch/arm/boot/zImage_temp arch/arm/boot/dts/imx6q-sabresd-ldo.dtb > arch/arm/boot/zImage"
cp arch/arm/boot/zImage arch/arm/boot/zImage_temp
cat arch/arm/boot/zImage_temp arch/arm/boot/dts/imx6q-sabresd-ldo.dtb > arch/arm/boot/zImage
rm arch/arm/boot/zImage_temp

# Call "mkimage" to create U-Boot image
${MKIMAGE} "$@"
