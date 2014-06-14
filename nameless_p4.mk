# Inherit device configuration for p4.
$(call inherit-product, device/samsung/p4/p4.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/nameless/config/apns.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Get all fonts and add some locales
$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, external/noto-fonts/fonts.mk)
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)
$(call inherit-product-if-exists, external/sil-fonts/fonts.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
PRODUCT_LOCALES += tl_PH en_PH en_JP

# Inherit some common nameless stuff.
$(call inherit-product, vendor/nameless/config/common.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := nameless_p4
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := p4
PRODUCT_MODEL := GT-P7500
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-P7500 BUILD_FINGERPRINT=samsung/GT-P7500/GT-P7500:4.0.4/IMM76D/XXLQ8:user/release-keys PRIVATE_BUILD_DESC="GT-P7500-user 4.0.4 IMM76D XXLQ8 release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := p4

$(call inherit-product, device/samsung/p4-common/version.mk)

# BeeGee properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-google \
	keyguard.no_require_sim=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dataroaming=false \
	persist.sys.root_access=1 \
	ro.HOME_APP_ADJ=1 \
	debug.sf.hw=1 \
	windowsmgr.max_events_per_sec=240 \
	ro.telephony.call_ring.delay=0 \
	wifi.supplicant_scan_interval=180 \
	pm.sleep_mode=1 \
	ro.ril.disable.power.collapse=0 \
	mot.proximity.delay=25 \
	debug.performance.tuning=1 \
	video.accelerate.hw=1 \
	ro.media.enc.jpeg.quality=100 \
	persist.sys.purgeable_assets=1 \
	ro.tether.denied=false \
	ro.secure=0 \
	debug.performance.tuning=1 \
	ro.max.fling_velocity=12000 \
	ro.min.fling_velocity=8000 \
	dalvik.vm.dexopt-flags=m=v,o=y \
	net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.wifi=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.umts=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.gprs=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.edge=4096,87380,256960,4096,16384,256960 \
	persist.sys.usb.config=mtp,adb

ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0 \
   ro.allow.mock.location=0 \
   ro.debuggable=1 \
   ro.secure=0 \
   persist.sys.usb.config=mtp,adb

# BeeGee statistics
PRODUCT_PACKAGES += \
    romstats \
    SimpleExplorer

# trick squisher to use smaller boot animation for this device
# and get some additional usufull apks into the ROM
PRODUCT_NO_BOOTANIMATION := true
PRODUCT_COPY_FILES += \
	device/samsung/p4-common/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip \
#	device/samsung/p4-common/prebuilt/apks/romstats.apk:system/app/romstats.apk \
#	device/samsung/p4-common/prebuilt/apks/SimpleExplorer.apk:system/app/SimpleExplorer.apk \

# Add some BeeGee versioning stuff
PRODUCT_PROPERTY_OVERRIDES += \
	ro.romstats.url=http://www.desire.giesecke.tk/romstats/ \
	ro.romstats.name=nameless_p4 \
	ro.romstats.version=$(ROMSTAT_VER) \
	ro.romstats.tframe=7 \
	ro.goo.developerid=beegee_tokyo \
	ro.goo.board=GT-P7500 \
	ro.goo.rom=nameless_p4 \
	ro.goo.version=$(GOO_VER)
