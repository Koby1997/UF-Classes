#include <jni.h>
#include <string>
#include "read_file.h"

extern "C"
JNIEXPORT jstring JNICALL
Java_edu_ufl_cise_os_p2_P2Activity_stringFromJNI(JNIEnv *env, jobject /* this */)
{
    std::string hello = "Hello from C++";
    return env->NewStringUTF(hello.c_str());
}

extern "C"
JNIEXPORT jstring JNICALL
Java_edu_ufl_cise_os_p2_P2Activity_readFile(JNIEnv *env, jobject, jstring input)
{
const char *filename = (*env).GetStringUTFChars(input, 0);
return env->NewStringUTF(read_file(filename));
}

extern "C"
JNIEXPORT jstring JNICALL
Java_edu_ufl_cise_os_p2_P2Activity_displayfile(JNIEnv *env, jobject, jstring input)
{
    const char *filename = (*env).GetStringUTFChars(input, 0);
    std::string output = displayfile(filename);
    return env->NewStringUTF(output.c_str());
}