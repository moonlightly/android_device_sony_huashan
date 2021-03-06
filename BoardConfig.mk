# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from msm8960-common
include device/sony/msm8960-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/huashan/include

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/msm8x60
TARGET_KERNEL_CONFIG := cm_viskan_huashan_defconfig

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
BOARD_VENDOR_PLATFORM := viskan

# Kernel information
BOARD_KERNEL_BASE  := 0x80200000
KEXEC_HB_PAGE_ADDR  := 0x88000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := androidboot.hardware=qcom user_debug=31 androidboot.baseband=msm msm_rtb.filter=0x3F ehci-hcd.park=3 vmalloc=400M androidboot.selinux=permissive selinux=0
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000

# Use legacy MMAP for pre-lollipop blobs
BOARD_USES_LEGACY_MMAP := true

# Time
BOARD_USES_QC_TIME_SERVICES := true

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

BOARD_USE_SONY_MACUPDATE := true

BOARD_HARDWARE_CLASS := device/sony/huashan/cmhw

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/huashan/bluetooth

# RIL
BOARD_PROVIDES_LIBRIL := true

# Needed for blobs
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

#Illumination Bar
TARGET_USES_ILLUMINAION_BAR := true

# Assert
TARGET_OTA_ASSERT_DEVICE := C5302,C5303,C5306,huashan,lbhuashan

# Audio
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true
BOARD_HAVE_CSD_FAST_CALL_SWITCH := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER_MIC := true

# FM Radio
QCOM_FM_ENABLED := true
AUDIO_FEATURE_ENABLED_FM := true

#Illumination Bar
TARGET_USES_ILLUMINAION_BAR := true

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 26

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648

# Include common SE policies
-include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/sony/huashan/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    property_contexts \
    bootanim.te \
    file.te \
    hostapd.te \
    illumination.te \
    init.te \
    init_shell.te \
    kernel.te \
    mac_update.te \
    mediaserver.te \
    mpdecision.te \
    netd.te \
    netmgrd.te \
    platform_app.te \
    property.te \
    radio.te \
    rild.te \
    rmt_storage.te \
    sdcardd.te \
    secchand.te \
    setup_fs.te \
    shell.te \
    surfaceflinger.te \
    system_app.te \
    system_monitor.te \
    system_server.te \
    tad_static.te \
    ta_qmi_service.te \
    updatemiscta.te \
    vold.te

# inherit from the proprietary version
-include vendor/sony/huashan/BoardConfigVendor.mk

#TWRP
#TW_BOARD_CUSTOM_GRAPHICS := ../../../device/sony/huashan/recovery/twrp_graphics.c
DEVICE_RESOLUTION := 720x1280
TW_HAS_NO_RECOVERY_PARTITION := true
TW_INCLUDE_JB_CRYPTO := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_MIN_BRIGHTNESS := 5
TW_EXTERNAL_STORAGE_PATH := "/sdcard1"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard1"
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := device/sony/huashan/recovery/twrp.fstab
RECOVERY_FSTAB_VERSION := 2
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CUSTOM_BOOTIMG_MK := device/sony/huashan/custombootimg.mk
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/msm_sdcc.1/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TW_INCLUDE_FUSE_EXFAT := true
TW_BRIGHTNESS_PATH := /sys/class/leds/wled:backlight/brightness
TW_MAX_BRIGHTNESS := 4095
TW_NO_SCREEN_BLANK := true
