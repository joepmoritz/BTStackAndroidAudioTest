#include <jni.h>
#include <android/log.h>
#include <stdlib.h>

#define LOGSRC "BTStack Audio Test"
#define MYLOG(...) __android_log_print(ANDROID_LOG_VERBOSE, LOGSRC, __VA_ARGS__)


int main(int argc, const char * argv[]);


JNIEXPORT void Java_com_yourincal_btstackaudiotest_MainActivity_run(JNIEnv* env, jobject thiz)
{
	MYLOG("Obtaining access...");
	int res = system("su root -c \"chmod -R 0777 /dev/bus/usb\"");
	if (res != 0)
	{
		__android_log_print(ANDROID_LOG_ERROR, "APP", "Can't obtain access to USB");
		return;
	}
	MYLOG("Done, booting btstack now");

	main(0, 0);
}