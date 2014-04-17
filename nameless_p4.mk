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
