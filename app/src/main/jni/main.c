#include <jni.h>
#include <android/log.h>
#include <stdlib.h>

#define LOGSRC "BTStack Audio Test"
#define MYLOG(...) __android_log_print(ANDROID_LOG_VERBOSE, LOGSRC, __VA_ARGS__)


int main(int argc, const char * argv[]);
void hci_transport_usb_set_fd(int fd);
void hci_transport_usb_set_device_path(const char* path);


JNIEXPORT void Java_com_yourincal_btstackaudiotest_MainActivity_run(JNIEnv* env, jobject thiz, jstring device_path, jint fd)
{
	// MYLOG("Obtaining access...");
	// int res = system("su root -c \"chmod -R 0777 /dev/bus/usb\"");
	// if (res != 0)
	// {
	// 	__android_log_print(ANDROID_LOG_ERROR, "APP", "Can't obtain access to USB");
	// 	return;
	// }
	// MYLOG("Done, booting btstack now");

	MYLOG("Got fd: %d\n", fd);
	hci_transport_usb_set_fd(fd);

	const char* path = (*env)->GetStringUTFChars( env, device_path , NULL );
	MYLOG("Got path: %s", path);
	hci_transport_usb_set_device_path(path);

	main(0, 0);
}