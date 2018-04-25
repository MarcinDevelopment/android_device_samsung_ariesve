
$(shell mkdir -p $(OUT)/obj/STATIC_LIBRARIES/libcommondefs-rpc_intermediates/)
$(shell touch $(OUT)/obj/STATIC_LIBRARIES/libcommondefs-rpc_intermediates/export_includes)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    gen-50000/loc_api_clnt.c \
    gen-50000/loc_api_cb_xdr.c \
    gen-50000/loc_api_common_xdr.c \
    gen-50000/loc_api_cb_svc.c \
    gen-50000/loc_api_xdr.c \
    gen-50000/loc_api_fixup.c \
    gen-50000/loc_api_rpc_glue.c \
    src/loc_apicb_appinit.c \
    src/loc_api_sync_call.c

LOCAL_CFLAGS := -fno-short-enums

LOCAL_CFLAGS += \
	-include inc-50000/loc_api_common.h \
	-DDEBUG \
	-DADD_XDR_FLOAT \
	-DADD_XDR_BOOL

LOCAL_SHARED_LIBRARIES:= librpc
LOCAL_STATIC_LIBRARIES:= libcommondefs-rpc

LOCAL_COPY_HEADERS_TO:= libloc_api-rpc/inc
LOCAL_COPY_HEADERS:= \
    inc-50000/loc_api_cb.h \
    inc-50000/loc_api_common.h \
    inc-50000/loc_api.h \
    inc-50000/loc_api_fixup.h \
    inc-50000/loc_apicb_appinit.h \
    inc/debug.h \
    inc/loc_api_rpc_glue.h \
    inc/loc_api_sync_call.h

LOCAL_C_INCLUDES:= \
    $(LOCAL_PATH) \
    $(LOCAL_PATH)/inc \
    $(LOCAL_PATH)/inc-50000 \
    $(TARGET_OUT_HEADERS)/libcommondefs-rpc \
    $(TARGET_OUT_HEADERS)/librpc

LOCAL_MODULE:= libloc_api-rpc

include $(BUILD_STATIC_LIBRARY)
