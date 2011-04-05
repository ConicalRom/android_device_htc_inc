#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
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

DEVICE=inc


if [ -d ../../../vendor/htc/$DEVICE/proprietary ]; then
	echo "Propreitary folder already created. "
else
	mkdir -p ../../../vendor/htc/$DEVICE/proprietary
fi


# Propreitary sensors driver
echo ""
echo "Extracting propreitary sensors driver"
adb pull /system/bin/akmd ../../../vendor/htc/$DEVICE/proprietary
chmod 755 ../../../vendor/htc/$DEVICE/proprietary/akmd

# Propreitary video drivers
echo ""
echo "Extracting propreitary video drivers"
adb pull /system/lib/libgsl.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/egl/libEGL_adreno200.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/egl/libGLESv1_CM_adreno200.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/egl/libGLESv2_adreno200.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/egl/libq3dtools_adreno200.so ../../../vendor/htc/$DEVICE/proprietary

# Propreitary audio files    
echo ""
echo "Extracting propreitary audio drivers"
adb pull /system/etc/WPDB.zip ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/snd8k ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/sound8k ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/TPA2018.csv ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/AudioBTID.csv ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libhtc_acoustic.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/liba2dp.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libaudiopolicy.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libaudio.so ../../../vendor/htc/$DEVICE/proprietary

# Propreitary firmware files    
echo ""
echo "Extracting firmware drivers"
adb pull /system/etc/firmware/default.acdb ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/default_PMIC.acdb ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/default_VZW.acdb ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/yamato_pfp.fw ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/yamato_pm4.fw ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/BCM4329B1_002.002.023.0436.0439.hcd ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/Incredible_C_20100310_VZW_Neo_324016_v4_PMIC.acdb ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/Incredible_C_20100319_VZW_Neo_324016_v5_VZW.acdb ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/Incredible_C_20100319_VZW_Neo_324016_v8_default.acdb ../../../vendor/htc/$DEVICE/proprietary

# Radio Interface
echo ""
echo "Extracting radio interface layer"
adb pull /system/lib/libhtc_ril.so ../../../vendor/htc/$DEVICE/proprietary

# Keypad
echo ""
echo "Extracting incredible keypad layout"
adb pull /system/usr/keychars/incrediblec-keypad.kcm.bin ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/usr/keylayout/h2w_headset.kl ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/usr/keylayout/incrediblec-keypad.kl ../../../vendor/htc/$DEVICE/proprietary

# Camera
#echo ""
echo "Extracting camera propreitary files"
adb pull /system/lib/libcamera.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/liboemcamera.so ../../../vendor/htc/$DEVICE/proprietary

# Codecs
echo ""
echo "Extracting propreitary codec files"
adb pull /system/lib/libOmxVdec.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libOmxVidEnc.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libomx_wmadec_sharedlibrary.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libomx_wmvdec_sharedlibrary.so ../../../vendor/htc/$DEVICE/proprietary

# ?
echo ""
echo "Extracting propreitary ? files"
adb pull /system/etc/pvasflocal.cfg ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libpvasfcommon.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libpvasflocalpb.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libpvasflocalpbreg.so ../../../vendor/htc/$DEVICE/proprietary

# Speech 
echo ""
echo "Extracting propreitary speech recognintion files"
adb pull /system/lib/libspeech.so ../../../vendor/htc/$DEVICE/proprietary

# GPS
echo ""
echo "Extracting propreitary GPS files"
adb pull /system/etc/agps_rm  ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libgps.so  ../../../vendor/htc/$DEVICE/proprietary


echo ""
echo ""

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/htc/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

# This file is generated by device/htc/__DEVICE__/extract-files.sh  

# Prebuilt libraries that are needed to build open-source libraries

# All the blobs necessary for generic incredible in obj/li  
PRODUCT_COPY_FILES += \\
 vendor/htc/__DEVICE__/proprietary/libaudio.so:/obj/lib/libaudio.so\\
 vendor/htc/__DEVICE__/proprietary/libaudiopolicy.so:obj/lib/libaudiopolicy.so\\
 vendor/htc/__DEVICE__/proprietary/libgps.so:/obj/lib/libgps.so \\
 vendor/htc/__DEVICE__/proprietary/libcamera.so:/obj/lib/libcamera.so \\
 vendor/htc/__DEVICE__/proprietary/liboemcamera.so:/obj/lib/liboemcamera.so

# Sensors blobs
PRODUCT_COPY_FILES += \\
  vendor/htc/__DEVICE__/proprietary/akmd:/system/bin/akmd 

# All the blobs necessary graphics acceleration
PRODUCT_COPY_FILES += \\
  vendor/htc/__DEVICE__/proprietary/libgsl.so:/system/lib/libgsl.so\\
  vendor/htc/__DEVICE__/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so\\
  vendor/htc/__DEVICE__/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so\\
  vendor/htc/__DEVICE__/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so\\
  vendor/htc/__DEVICE__/proprietary/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so

# Audio Files
PRODUCT_COPY_FILES += \\
  vendor/htc/__DEVICE__/proprietary/snd8k:/system/bin/snd8k \\
  vendor/htc/__DEVICE__/proprietary/sound8k:/system/bin/sound8k \\
  vendor/htc/__DEVICE__/proprietary/AudioBTID.csv:/system/etc/AudioBTID.csv \\
  vendor/htc/__DEVICE__/proprietary/TPA2018.csv:/system/etc/TPA2018.csv\\
  vendor/htc/__DEVICE__/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so\\
  vendor/htc/__DEVICE__/proprietary/liba2dp.so:/system/lib/liba2dp.so\\
  vendor/htc/__DEVICE__/proprietary/libaudiopolicy.so:/system/lib/libaudiopolicy.so\\
  vendor/htc/__DEVICE__/proprietary/libaudio.so:/system/lib/libaudio.so\\
  vendor/htc/__DEVICE__/proprietary/WPDB.zip:/system/etc/WPDB.zip 


# Radio Interface
PRODUCT_COPY_FILES += \\
  vendor/htc/__DEVICE__/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so 

# Keypad Files
PRODUCT_COPY_FILES += \\
  vendor/htc/__DEVICE__/proprietary/incrediblec-keypad.kcm.bin:/system/usr/keychars/incrediblec-keypad.kcm.bin \\
  vendor/htc/__DEVICE__/proprietary/h2w_headset.kl:/system/usr/keylayout/h2w_headset.kl \\
  vendor/htc/__DEVICE__/proprietary/incrediblec-keypad.kl:/system/usr/keylayout/incrediblec-keypad.kl

# Speech
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/libspeech.so:/system/lib/libspeech.so 

# GPS
PRODUCT_COPY_FILES += \\
  vendor/htc/__DEVICE__/proprietary/agps_rm:/system/etc/agps_rm\\
  vendor/htc/__DEVICE__/proprietary/libgps.so:/system/lib/libgps.so

# Firmware
PRODUCT_COPY_FILES += \\
 vendor/htc/__DEVICE__/proprietary/BCM4329B1_002.002.023.0436.0439.hcd:/system/etc/firmware/BCM4329B1_002.002.023.0436.0439.hcd \\
  vendor/htc/__DEVICE__/proprietary/Incredible_C_20100310_VZW_Neo_324016_v4_PMIC.acdb:/system/etc/firmware/Incredible_C_20100310_VZW_Neo_324016_v4_PMIC.acdb \\
    vendor/htc/__DEVICE__/proprietary/Incredible_C_20100319_VZW_Neo_324016_v5_VZW.acdb:/system/etc/firmware/Incredible_C_20100319_VZW_Neo_324016_v5_VZW.acdb \\
    vendor/htc/__DEVICE__/proprietary/Incredible_C_20100319_VZW_Neo_324016_v8_default.acdb:/system/etc/firmware/Incredible_C_20100319_VZW_Neo_324016_v8_default.acdb \\
    vendor/htc/__DEVICE__/proprietary/default.acdb:/system/etc/firmware/default.acdb \\
    vendor/htc/__DEVICE__/proprietary/default_PMIC.acdb:/system/etc/firmware/default_PMIC.acdb \\
    vendor/htc/__DEVICE__/proprietary/default_VZW.acdb:/system/etc/firmware/default_VZW.acdb \\
    vendor/htc/__DEVICE__/proprietary/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \\
    vendor/htc/__DEVICE__/proprietary/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw 

# Camera
#PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/liboemcamera.so:/system/lib/liboemcamera.so 
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:/system/lib/libcamera.so 

#    vendor/htc/__DEVICE__/proprietary/libomx_avcdec_sharedlibrary.so:/system/lib/#libomx_avcdec_sharedlibrary.so \\

# ?
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/pvasflocal.cfg:/system/etc/pvasflocal.cfg \\
    vendor/htc/__DEVICE__/proprietary/libpvasfcommon.so:/system/lib/libpvasfcommon.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasflocalpb.so:/system/lib/libpvasflocalpb.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasflocalpbreg.so:/system/lib/libpvasflocalpbreg.so 

# Codecs
PRODUCT_COPY_FILES += \\
  vendor/htc/__DEVICE__/proprietary/libOmxVdec.so:/system/lib/libOmxVdec.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxVidEnc.so:/system/lib/libOmxVidEnc.so \\
   vendor/htc/__DEVICE__/proprietary/libomx_wmadec_sharedlibrary.so:/system/lib/libomx_wmadec_sharedlibrary.so \\
    vendor/htc/__DEVICE__/proprietary/libomx_wmvdec_sharedlibrary.so:/system/lib/libomx_wmvdec_sharedlibrary.so 


EOF


./setup-makefiles.sh







 


   
  
  

 


  


