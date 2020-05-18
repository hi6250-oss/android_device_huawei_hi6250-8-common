#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter barca berlin prague rhone warsaw, $(TARGET_DEVICE)),)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)

# EGL symlinks
EGL_LIBS := libOpenCL.so libOpenCL.so.1 libOpenCL.so.1.1 hw/vulkan.hi6250.so

EGL_32_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/lib/,$(EGL_LIBS))
$(EGL_32_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "EGL 32 lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib/egl/libGLES_mali.so $@

EGL_64_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/lib64/,$(EGL_LIBS))
$(EGL_64_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "EGL 64 lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib64/egl/libGLES_mali.so $@

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

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_NATIVE_PACKAGES_FIXUP) $(SYSTEM_NATIVE_PACKAGES_FIXUP) $(RES_NATIVE_PACKAGES_FIXUP) $(EGL_32_SYMLINKS) $(EGL_64_SYMLINKS)

endif
