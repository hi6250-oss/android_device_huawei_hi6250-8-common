#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter prague warsaw,$(TARGET_DEVICE)),)
include $(CLEAR_VARS)

# OpenCL Symlinks
LIBOPENCL1_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libOpenCL.so.1
$(LIBOPENCL1_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/libOpenCL.so.1 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib/libOpenCL.so $@

LIBOPENCL641_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/libOpenCL.so.1
$(LIBOPENCL641_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/libOpenCL.so.1 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib64/libOpenCL.so $@

LIBOPENCL11_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libOpenCL.so.1.1
$(LIBOPENCL11_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/libOpenCL.so.1.1 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib/libOpenCL.so.1 $@

LIBOPENCL6411_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/libOpenCL.so.1.1
$(LIBOPENCL6411_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/libOpenCL.so.1.1 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib64/libOpenCL.so.1 $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(LIBOPENCL1_SYMLINK) \
	$(LIBOPENCL641_SYMLINK) \
	$(LIBOPENCL11_SYMLINK) \
	$(LIBOPENCL6411_SYMLINK)

# Vulkan Symlinks
LIBGLES_MALI_LIBRARY := /vendor/lib/egl/libGLES_mali.so
LIBGLES_MALI64_LIBRARY := /vendor/lib64/egl/libGLES_mali.so

VULKAN_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/vulkan.hi6250.so
$(VULKAN_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/hw/vulkan.hi6250.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(LIBGLES_MALI_LIBRARY) $@

VULKAN64_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.hi6250.so
$(VULKAN64_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/hw/vulkan.hi6250.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(LIBGLES_MALI64_LIBRARY) $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(VULKAN_SYMLINK) \
	$(VULKAN64_SYMLINK)

# native_packages hack
VENDOR_NATIVE_PACKAGES_FIXUP := $(TARGET_OUT_VENDOR)/etc/native_packages.xml
$(VENDOR_NATIVE_PACKAGES_FIXUP): $(TARGET_OUT_VENDOR)/etc/native_packages.bin
	@echo "Move native_packages.bin to native_packages.xml"
	$(hide) mv $(TARGET_OUT_VENDOR)/etc/native_packages.bin $@

SYSTEM_NATIVE_PACKAGES_FIXUP := $(TARGET_OUT_VENDOR)/etc/system_packages.xml
$(SYSTEM_NATIVE_PACKAGES_FIXUP): $(TARGET_OUT_VENDOR)/etc/system_packages.bin
	@echo "Move system_packages.bin to system_packages.xml"
	$(hide) mv $(TARGET_OUT_VENDOR)/etc/system_packages.bin $@

RES_NATIVE_PACKAGES_FIXUP := $(TARGET_OUT_VENDOR)/etc/res_pkgs.xml
$(RES_NATIVE_PACKAGES_FIXUP): $(TARGET_OUT_VENDOR)/etc/res_pkgs.bin
	@echo "Move res_pkgs.bin to res_pkgs.xml"
	$(hide) mv $(TARGET_OUT_VENDOR)/etc/res_pkgs.bin $@

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_NATIVE_PACKAGES_FIXUP) $(SYSTEM_NATIVE_PACKAGES_FIXUP) $(RES_NATIVE_PACKAGES_FIXUP)

include $(call all-makefiles-under,$(LOCAL_PATH))
endif
