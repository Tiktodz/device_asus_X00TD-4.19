#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Inherit some common Evolution-X stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from X00TD device.
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit some Evolution-X flags.
BUILD_BCR := false
EVO_BUILD_TYPE := Unofficial
SYSTEM_OPTIMIZE_JAVA := true
SYSTEMUI_OPTIMIZE_JAVA := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_BUILD_DEVICE_AS_WEBCAM := true
TARGET_EXCLUDES_AUDIOFX := true
TARGET_INCLUDE_ACCORD := false
WITH_GMS := false

# R8 Java optimizations for SystemUI and system_server,
SYSTEM_OPTIMIZE_JAVA := true
SYSTEMUI_OPTIMIZE_JAVA := true

# Device identifier
# This must come after all inclusions.
PRODUCT_NAME := lineage_X00TD
PRODUCT_DEVICE := X00TD
PRODUCT_BRAND := asus
PRODUCT_MODEL := Zenfone Max Pro M1
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceProduct=ASUS_X00TD
