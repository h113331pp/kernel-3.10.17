# clean dtb files, Image
rm arch/arm/boot/dts/.imx6q-sabresd-ldo.dtb.*
rm arch/arm/boot/dts/imx6q-sabresd-ldo.dtb
rm arch/arm/boot/uImage
rm arch/arm/boot/zImage

LOADADDR=0x10800000 make -j4 CROSS_COMPILE=arm-none-linux-gnueabi- ARCH=arm imx6q-sabresd-ldo.dtb
LOADADDR=0x10800000 make -j4 CROSS_COMPILE=arm-none-linux-gnueabi- ARCH=arm uImage
