#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <log/log.h>

#define LOG_BUF_SIZE 1024

extern "C" {
    bool android_log_shouldPrintLine(char *param_1,
        char *param_2, uint param_3) {
            return (strcmp(param_2, param_1));
    }

    void android_log_printLogLine(){
	// Deprecated
    }

    int __android_logPower_print(int bufID, int prio, const char *tag,
        const char *fmt, ...)
    {
	    va_list ap;

	    char buf[LOG_BUF_SIZE];
	    int _a = bufID;
	    int _b = prio;

	    va_start(ap, fmt);
	    va_end(ap);

	    return __android_log_write(ANDROID_LOG_DEBUG, tag, "logPower_print not support");
    }

    int __android_log_exception_buf_write(int bufID, int prio, const char *tag,
		const char *fmt, ...)
	{
		va_list ap;
		char buf[LOG_BUF_SIZE];
		int _a = bufID;
		int _b = prio;

		va_start(ap, fmt);
		vsnprintf(buf, LOG_BUF_SIZE, fmt, ap);
		va_end(ap);

		char new_tag[128];
		snprintf(new_tag, sizeof(new_tag), "EX-%s", tag);

		return __android_log_buf_write(LOG_ID_MAIN, ANDROID_LOG_ERROR, new_tag, buf);
	}
}
