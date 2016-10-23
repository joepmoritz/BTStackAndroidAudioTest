LOCAL_PATH:= $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE    := main
LOCAL_SRC_FILES := main.c
LOCAL_SHARED_LIBRARIES += libusb1.0
LOCAL_LDLIBS += -llog
LOCAL_CFLAGS += -std=c11


# include BTStack into this module
BTSTACK_PATH := /Users/jmoritz/My_Documents/Spraakvanger/btstack

LOCAL_C_INCLUDES += \
	$(BTSTACK_PATH)/port/libusb \
	$(BTSTACK_PATH)/src/ble \
	$(BTSTACK_PATH)/src/classic \
	$(BTSTACK_PATH)/src/ \
	$(BTSTACK_PATH)/platform/posix \
	$(BTSTACK_PATH)/example \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/include \
	$(BTSTACK_PATH)/3rd-party/bluedroid/encoder/include

LOCAL_SRC_FILES += \
	$(BTSTACK_PATH)/platform/posix/btstack_run_loop_posix.c \
	$(BTSTACK_PATH)/platform/posix/btstack_link_key_db_fs.c \
	$(BTSTACK_PATH)/platform/libusb/hci_transport_h2_libusb.c \
	$(BTSTACK_PATH)/src/btstack_memory.c            \
	$(BTSTACK_PATH)/src/btstack_linked_list.c	    \
	$(BTSTACK_PATH)/src/btstack_memory_pool.c       \
	$(BTSTACK_PATH)/src/btstack_run_loop.c		    \
	$(BTSTACK_PATH)/src/btstack_util.c 	            \
	$(BTSTACK_PATH)/src/hci.c			            \
	$(BTSTACK_PATH)/src/hci_cmd.c		            \
	$(BTSTACK_PATH)/src/hci_dump.c		            \
	$(BTSTACK_PATH)/src/l2cap.c			            \
	$(BTSTACK_PATH)/src/l2cap_signaling.c	        \
	$(BTSTACK_PATH)/src/classic/sdp_util.c	                \
	$(BTSTACK_PATH)/src/classic/spp_server.c  				\
	$(BTSTACK_PATH)/src/classic/rfcomm.c	                \
	$(BTSTACK_PATH)/src/classic/bnep.c	                    \
	$(BTSTACK_PATH)/src/classic/sdp_server.c			            \
	$(BTSTACK_PATH)/src/classic/hfp.c \
	$(BTSTACK_PATH)/src/classic/hfp_gsm_model.c \
	$(BTSTACK_PATH)/src/classic/hfp_ag.c \
	$(BTSTACK_PATH)/src/classic/sdp_client.c \
	$(BTSTACK_PATH)/src/classic/sdp_client_rfcomm.c \
	$(BTSTACK_PATH)/example/hfp_ag_demo.c \
	$(BTSTACK_PATH)/port/libusb/main.c \
	$(BTSTACK_PATH)/example/sco_demo_util.c \
	$(BTSTACK_PATH)/platform/posix/wav_util.c \
	$(BTSTACK_PATH)/src/classic/btstack_sbc_bludroid.c \
	${BTSTACK_PATH}/src/classic/hfp_msbc.c \
	${BTSTACK_PATH}/src/classic/btstack_sbc_plc.c \
	${BTSTACK_PATH}/src/classic/btstack_cvsd_plc.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/alloc.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/bitalloc.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/bitalloc-sbc.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/bitstream-decode.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/decoder-oina.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/decoder-private.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/decoder-sbc.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/dequant.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/framing.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/framing-sbc.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/oi_codec_version.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/synthesis-sbc.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/synthesis-dct8.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/decoder/srce/synthesis-8-generated.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/encoder/srce/sbc_analysis.c           \
	$(BTSTACK_PATH)/3rd-party/bluedroid/encoder/srce/sbc_dct.c                \
	$(BTSTACK_PATH)/3rd-party/bluedroid/encoder/srce/sbc_dct_coeffs.c         \
	$(BTSTACK_PATH)/3rd-party/bluedroid/encoder/srce/sbc_enc_bit_alloc_mono.c \
	$(BTSTACK_PATH)/3rd-party/bluedroid/encoder/srce/sbc_enc_bit_alloc_ste.c  \
	$(BTSTACK_PATH)/3rd-party/bluedroid/encoder/srce/sbc_enc_coeffs.c         \
	$(BTSTACK_PATH)/3rd-party/bluedroid/encoder/srce/sbc_encoder.c            \
	$(BTSTACK_PATH)/3rd-party/bluedroid/encoder/srce/sbc_packing.c            \



include $(BUILD_SHARED_LIBRARY)


include /Users/jmoritz/My_Documents/Spraakvanger/libusb/android/jni/libusb.mk
