#!/bin/bash

export TZ=Asia/Jakarta

# Removing
rm -rf device/asus/sdm660-common
rm -rf kernel/asus
rm -rf vendor/asus

## Cloning
git clone --depth=1 https://github.com/Tiktodz/device_asus_sdm660-common-4.19 -b 16 device/asus/sdm660-common
git clone --depth=1 https://github.com/Tiktodz/android_kernel_asus_sdm660-4.19x -b cam-legacy/lineage-23.2 --single-branch kernel/asus/sdm660
git clone --depth=1 https://github.com/Tiktodz/vendor_asus-4.19 -b 16 vendor/asus

## Integrate KernelSU
#cd kernel/asus/sdm660
#curl -LSs "https://raw.githubusercontent.com/Sorayukii/KernelSU-Next/stable/kernel/setup.sh" | bash -s hookless
#cd -

#### signing
rm -rf vendor/voltage-priv/keys
git clone https://github.com/VoltageOS/vendor_voltage-priv_keys vendor/voltage-priv/keys
sed -i 's|PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/voltage-priv/keys/testkey|PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/voltage-priv/keys/releasekey|g' vendor/voltage-priv/keys/keys.mk
cd vendor/voltage-priv/keys
bash keys.sh
cd -
