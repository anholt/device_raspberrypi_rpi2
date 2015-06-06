#
# Copyright 2014 The Android Open-Source Project
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
#

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/raspberrypi/rpi2-kernel/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	device/generic/goldfish/camera/media_profiles.xml:system/etc/media_profiles.xml \
	device/generic/goldfish/camera/media_codecs.xml:system/etc/media_codecs.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(LOCAL_PATH)/rpi2_core_hardware.xml:system/etc/permissions/rpi2_core_hardware.xml \
	$(LOCAL_PATH)/init.rpi2.rc:root/init.rpi2.rc \
	$(LOCAL_PATH)/init.usb.rc:root/init.usb.rc \
	$(LOCAL_PATH)/fstab.rpi2:root/fstab.rpi2 \
	$(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES := \
	libwpa_client \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf \
	libGLES_mesa \
	libgralloc_drm \
	$()

$(call inherit-product-if-exists, vendor/raspberrypi/rpi2/device-vendor.mk)
