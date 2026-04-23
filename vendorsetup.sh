#!/bin/bash

export TZ=Asia/Jakarta

# Removing
rm -rf device/asus/sdm660-common
rm -rf kernel/asus
rm -rf vendor/asus
#rm -rf lineage/scripts

## Cloning
git clone --depth=1 https://github.com/Tiktodz/device_asus_sdm660-common-4.19 -b clover device/asus/sdm660-common
git clone --depth=1 https://github.com/sotodrom/kernel_asus_sdm660-4.19 -b 16 --single-branch kernel/asus/sdm660
git clone --depth=1 https://github.com/Tiktodz/vendor_asus-4.19 -b clover vendor/asus
#git clone --depth=1 https://github.com/LineageOS/scripts lineage/scripts

## Integrate KernelSU
cd kernel/asus/sdm660
curl -LSs "https://raw.githubusercontent.com/Sorayukii/KernelSU-Next/stable/kernel/setup.sh" | bash -s hookless
cd -

#cd build/make
#git fetch https://github.com/texascake/crdroid_build
#git cherry-pick 84fffb6d824f6b5d10da2e93032fb67ea0586bbd^..4f0a4447d1c0084e662d76623012d0666cf56590 --no-edit
#cd -

# Add DT2W support
cd hardware/lineage/interfaces
curl https://github.com/SonicBSV/android_hardware_lineage_interfaces/commit/3ab0a8f574318a8ca3ab0035d2182d9ec275159e.patch | git am
cd -

# Add patches for 4.19 legacy kernel support
#cd packages/modules/Connectivity
#curl https://github.com/SonicBSV/android_packages_modules_Connectivity/commit/e77173f800140561b4ff23158a0be7235ebb87b3.patch | git am
#cd -

# Add tfa98xx support
cd hardware/qcom-caf/sdm660/audio
curl https://github.com/SonicBSV/android_hardware_qcom-caf_sdm660_audio/commit/0f054bebe534de1dbe1d8cac7d33a25a5f21d7fb.patch | git am
cd -

#### signing
#rm -rf vendor/lineage-priv/keys
#mkdir -p vendor/lineage-priv/keys
#sed -i 's|PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/lineage-priv/keys/testkey|PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/lineage-priv/keys/releasekey|g' lineage/scripts/lineage-priv-template/keys.mk
#cp -R lineage/scripts/lineage-priv-template/* vendor/lineage-priv/keys/
#cd vendor/lineage-priv/keys
#bash keys.sh
#cd -
