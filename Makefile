ARCHS = armv7

include theos/makefiles/common.mk

TWEAK_NAME = 2048AutoPlay
2048AutoPlay_FILES = Tweak.xm
2048AutoPlay_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
