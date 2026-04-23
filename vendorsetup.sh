#!/bin/bash

export TZ=Asia/Jakarta

# Removing
rm -rf device/asus/sdm660-common
rm -rf kernel/asus
rm -rf vendor/asus

## Cloning
git clone --depth=1 https://github.com/Tiktodz/device_asus_sdm660-common-4.19 -b newpart device/asus/sdm660-common
git clone --depth=1 https://github.com/sotodrom/kernel_asus_sdm660-4.19 -b newpart --single-branch kernel/asus/sdm660
git clone --depth=1 https://github.com/Tiktodz/vendor_asus-4.19 -b vos vendor/asus

## Integrate KernelSU
cd kernel/asus/sdm660
curl -LSs "https://raw.githubusercontent.com/Sorayukii/KernelSU-Next/stable/kernel/setup.sh" | bash -s hookless
cd -

# Add DT2W support
cd hardware/lineage/interfaces
curl https://github.com/SonicBSV/android_hardware_lineage_interfaces/commit/3ab0a8f574318a8ca3ab0035d2182d9ec275159e.patch | git am
cd -

# Add tfa98xx support
cd hardware/qcom-caf/sdm660/audio
curl https://github.com/SonicBSV/android_hardware_qcom-caf_sdm660_audio/commit/0f054bebe534de1dbe1d8cac7d33a25a5f21d7fb.patch | git am
cd -
