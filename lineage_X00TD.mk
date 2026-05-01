#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

TARGET_BOOT_ANIMATION_RES := 1080

TARGET_DISABLE_EPPE := true

# Inherit some common LineageOS stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

AXION_CAMERA_REAR_INFO := 16,5
AXION_CAMERA_FRONT_INFO := 16
AXION_MAINTAINER := EunjiX
AXION_PROCESSOR := Snapdragon_636
TARGET_ENABLE_BLUR := true
TARGET_INCLUDE_AXFX := true
WITH_GMS := true

# Inherit from X00TD device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_X00TD
PRODUCT_DEVICE := X00TD
PRODUCT_BRAND := asus
PRODUCT_MODEL := Zenfone Max Pro M1
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceProduct=ASUS_X00TD
