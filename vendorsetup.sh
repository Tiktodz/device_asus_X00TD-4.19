#!/bin/bash

export TZ=Asia/Jakarta

# Removing
rm -rf device/asus/sdm660-common
rm -rf kernel/asus
rm -rf vendor/asus
rm -rf lineage/scripts

## Cloning
git clone --depth=1 https://github.com/Tiktodz/device_asus_sdm660-common-4.19 -b vos device/asus/sdm660-common
git clone --depth=1 https://github.com/sotodrom/kernel_asus_sdm660-4.19 -b 16 --single-branch kernel/asus/sdm660
git clone --depth=1 https://github.com/Tiktodz/vendor_asus-4.19 -b vos vendor/asus
git clone --depth=1 https://github.com/LineageOS/scripts lineage/scripts

## Integrate KernelSU
cd kernel/asus/sdm660
curl -LSs "https://raw.githubusercontent.com/Sorayukii/KernelSU-Next/stable/kernel/setup.sh" | bash -s hookless
cd -

# Add DT2W support
cd hardware/voltage/interfaces
curl https://github.com/SonicBSV/android_hardware_lineage_interfaces/commit/3ab0a8f574318a8ca3ab0035d2182d9ec275159e.patch | git am
cd -

# Add tfa98xx support
cd hardware/qcom-caf/sdm660/audio
curl https://github.com/SonicBSV/android_hardware_qcom-caf_sdm660_audio/commit/0f054bebe534de1dbe1d8cac7d33a25a5f21d7fb.patch | git am
cd -

#### signing
rm -rf vendor/voltage-priv/keys
mkdir -p vendor/voltage-priv/keys
sed -i 's|PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/lineage-priv/keys/testkey|PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/voltage-priv/keys/releasekey|g' lineage/scripts/lineage-priv-template/keys.mk
cp -R lineage/scripts/lineage-priv-template/* vendor/voltage-priv/keys/
cd vendor/voltage-priv/keys
bash keys.sh
cd -
