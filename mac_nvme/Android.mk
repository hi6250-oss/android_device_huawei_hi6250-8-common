#
# Copyright (C) 2020-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := mac_nvme.cpp
LOCAL_SHARED_LIBRARIES := libcutils liblog
LOCAL_CFLAGS += -Wall -Wextra -Werror
LOCAL_MODULE := mac_nvme
LOCAL_INIT_RC := mac_nvme.rc
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_EXECUTABLE)
