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
# This is the media capabilities product configuration for a generic incredible,
# 
#

PRODUCT_PROPERTY_OVERRIDES += \
	ro.media.enc.hprof.file.format=mp4 \
	ro.media.enc.hprof.codec.vid=m4v \
	ro.media.enc.hprof.codec.aud=amrnb \
	ro.media.enc.hprof.vid.width=720 \
	ro.media.enc.hprof.vid.height=480 \
	ro.media.enc.hprof.vid.fps=24 \
	ro.media.enc.hprof.vid.bps=2000000 \
	ro.media.enc.hprof.aud.bps=12200 \
	ro.media.enc.hprof.aud.hz=8000 \
	ro.media.enc.hprof.aud.ch=1 \
	ro.media.enc.hprof.duration=60 \
	ro.media.enc.lprof.file.format=3gp \
	ro.media.enc.lprof.codec.vid=m4v \
	ro.media.enc.lprof.codec.aud=amrnb \
	ro.media.enc.lprof.vid.width=176 \
	ro.media.enc.lprof.vid.height=144 \
	ro.media.enc.lprof.vid.fps=15 \
	ro.media.enc.lprof.vid.bps=256000 \
	ro.media.enc.lprof.aud.bps=12200 \
	ro.media.enc.lprof.aud.hz=8000 \
	ro.media.enc.lprof.aud.ch=1 \
	ro.media.enc.lprof.duration=30 \
	ro.media.enc.file.format=3gp,mp4 \
	ro.media.enc.vid.codec=m4v,h263,h264 \
	ro.media.enc.aud.codec=amrnb \
	ro.media.enc.vid.h263.width=176,1280 \
	ro.media.enc.vid.h263.height=144,720 \
	ro.media.enc.vid.h263.bps=64000,6000000 \
	ro.media.enc.vid.h263.fps=1,30 \
	ro.media.enc.vid.m4v.width=176,1280 \
	ro.media.enc.vid.m4v.height=144,720 \
	ro.media.enc.vid.m4v.bps=64000,8000000 \
	ro.media.enc.vid.m4v.fps=1,30 \
	ro.media.enc.vid.h264.width=176,800 \
	ro.media.enc.vid.h264.height=144,480 \
	ro.media.enc.vid.h264.bps=64000,6000000 \
	ro.media.enc.vid.h264.fps=1,30 \
	ro.media.enc.aud.amrnb.bps=5525,12200 \
	ro.media.enc.aud.amrnb.hz=8000,8000 \
	ro.media.enc.aud.amrnb.ch=1,1 \
	ro.media.dec.aud.wma.enabled=1 \
	ro.media.dec.vid.wmv.enabled=1 \
	ro.media.cam.preview.fps=0 \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.media.enc.jpeg.quality=95,85,70

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/inc/Generic/media_profiles.xml:system/etc/media_profiles.xml


