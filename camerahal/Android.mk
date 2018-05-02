LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_SRC_FILES := \
    cameraHAL.cpp \
    Overlay.cpp

LOCAL_SRC_FILES := \
    exif/exif.c \
    exif/gpsinfo.c \
    exif/iptc.c \
    exif/jhead.c \
    exif/jpgfile.c \
    exif/makernote.c

LOCAL_C_INCLUDES := $(TOP)/frameworks/native/include

LOCAL_C_INCLUDES += $(call project-path-for,qcom-display)/libgralloc \
                    system/media/camera/include

LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := liblog libutils libhardware libcamera_client
LOCAL_SHARED_LIBRARIES += libseccameraadaptor

include $(BUILD_SHARED_LIBRARY)
