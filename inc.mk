#
# Copyright (C) 2009 The Android Open Source Project
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




#
# This is the product configuration for a generic CDMA Incredible,
# not specialized for any geography.
#
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us.mk)

$(call inherit-product-if-exists, vendor/htc/inc/inc-vendor.mk)

$(call inherit-product, device/htc/inc/Generic/kernel.mk)
# Carrier properties
$(call inherit-product, device/htc/inc/Generic/carrier.mk)
# Media Capabilities
$(call inherit-product, device/htc/inc/Generic/media.mk)
$(call inherit-product, device/htc/inc/Generic/media_a1026.mk)

# Kernel Modules
$(call inherit-product, device/htc/inc/Generic/modules.mk)
# Overlay packages
$(call inherit-product, device/htc/inc/Generic/overlay.mk)
# Product packages
$(call inherit-product, device/htc/inc/Generic/packages.mk)
# Permisions
$(call inherit-product, device/htc/inc/Generic/permission.mk)
# Firmware
$(call inherit-product, device/htc/inc/Generic/firmware.mk)
# Frameworks
$(call inherit-product, device/htc/inc/Generic/frameworks.mk)


$(call inherit-product, device/htc/inc/Generic/configs.mk)



# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Incredible uses high-density artwork where available
PRODUCT_LOCALES := hdpi

# Incredible has more memory so we can use larger VM size
PRODUCT_PROPERTY_OVERRIDES := \
    dalvik.vm.heapsize=32m
# We need the radio interface library to communicate with the baseband radio
PRODUCT_PROPERTY_OVERRIDES := \
    rild.libpath=/system/lib/libhtc_ril.so 

# Prelinked AudioFails use fallowing as workaround
SKIP_PRELINK_LIBAUDIO := true

# Copy the init.inc.rc script
PRODUCT_COPY_FILES += \
device/htc/inc/init.inc.rc:./root/init.inc.rc

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full.mk)





PRODUCT_NAME := generic_inc
PRODUCT_DEVICE := inc




PRODUCT_BRAND := htc 
PRODUCT_MODEL := ADR6300  
PRODUCT_MANUFACTURER := HTC


