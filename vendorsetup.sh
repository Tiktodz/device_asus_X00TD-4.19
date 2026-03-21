#!/bin/bash

# Removing
rm -rf build/make
rm -rf kernel/asus
rm -rf vendor/asus

# Cloning
git clone --depth=1 https://github.com/Kneba/android_build build/make
git clone --depth=1 --recurse-submodules https://github.com/Tiktodz/android_kernel_asus_sdm660 --single-branch kernel/asus/sdm660
git clone --depth=1 https://github.com/Tiktodz/vendor_asus-4.19 -b 16.2 vendor/asus

# Renaming
sed -i 's/CONFIG_LOCALVERSION=.*/CONFIG_LOCALVERSION="-TOM-969"/g' kernel/asus/sdm660/arch/arm64/configs/asus/X00TD_defconfig

# Signing
rm -rf vendor/lineage-priv/keys
mkdir -p vendor/lineage-priv/keys
cp -R lineage/scripts/lineage-priv-template/* vendor/lineage-priv/keys/
cd vendor/lineage-priv/keys
bash keys.sh
cd -
