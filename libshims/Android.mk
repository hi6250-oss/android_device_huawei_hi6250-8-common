#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := log_shim.cpp
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := libshim_log
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ril_shim.cpp
LOCAL_MODULE := libshim_ril
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)
