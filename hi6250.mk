#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Common Path
COMMON_PATH := device/huawei/hi6250-8-common

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor

# Init
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/init/fstab.hi6250:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.hi6250 \
    $(COMMON_PATH)/configs/init/fstab.hi6250:$(TARGET_COPY_OUT_RAMDISK)/fstab.hi6250 \
    $(COMMON_PATH)/configs/init/init.audio.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.audio.rc \
    $(COMMON_PATH)/configs/init/init.balong_modem.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.balong_modem.rc \
    $(COMMON_PATH)/configs/init/init.connectivity.bcm43455.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.connectivity.bcm43455.rc \
    $(COMMON_PATH)/configs/init/init.connectivity.gps.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.connectivity.gps.rc \
    $(COMMON_PATH)/configs/init/init.connectivity.hi1102.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.connectivity.hi1102.rc \
    $(COMMON_PATH)/configs/init/init.device.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.device.rc \
    $(COMMON_PATH)/configs/init/init.hi6250.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.hi6250.rc \
    $(COMMON_PATH)/configs/init/init.hisi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.hisi.rc \
    $(COMMON_PATH)/configs/init/init.manufacture.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.manufacture.rc \
    $(COMMON_PATH)/configs/init/init.performance.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.performance.rc \
    $(COMMON_PATH)/configs/init/init.platform.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.platform.rc \
    $(COMMON_PATH)/configs/init/init.recovery.hi6250.rc:$(TARGET_RECOVERY_OUT)/root/init.recovery.hi6250.rc \
    $(COMMON_PATH)/configs/init/init.tee.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.tee.rc \
    $(COMMON_PATH)/configs/init/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

# Treble
PRODUCT_USE_VNDK_OVERRIDE := true
