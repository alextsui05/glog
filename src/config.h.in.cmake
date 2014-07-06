/* src/config.h.in.  Generated from configure.ac by autoheader.  */

/* define if glog doesn't use RTTI */
#cmakedefine DISABLE_RTTI

/* Namespace for Google classes */
#define GOOGLE_NAMESPACE @GOOGLE_NAMESPACE@

/* Define if you have the `dladdr' function */
#cmakedefine HAVE_DLADDR

/* Define to 1 if you have the <dlfcn.h> header file. */
#cmakedefine01 HAVE_DLFCN_H

/* Define to 1 if you have the <execinfo.h> header file. */
#cmakedefine01 HAVE_EXECINFO_H

/* Define if you have the `fcntl' function */
#cmakedefine HAVE_FCNTL

/* Define to 1 if you have the <glob.h> header file. */
#cmakedefine01 HAVE_GLOB_H

/* Define to 1 if you have the <inttypes.h> header file. */
#cmakedefine01 HAVE_INTTYPES_H

/* Define to 1 if you have the `pthread' library (-lpthread). */
#cmakedefine01 HAVE_LIBPTHREAD

/* Define to 1 if you have the <libunwind.h> header file. */
#cmakedefine01 HAVE_LIBUNWIND_H

/* define if you have google gflags library */
#cmakedefine HAVE_LIB_GFLAGS

/* define if you have google gmock library */
#cmakedefine HAVE_LIB_GMOCK

/* define if you have google gtest library */
#cmakedefine HAVE_LIB_GTEST

/* define if you have libunwind */
#cmakedefine HAVE_LIB_UNWIND

/* Define to 1 if you have the <memory.h> header file. */
#cmakedefine01 HAVE_MEMORY_H

/* define if the compiler implements namespaces */
#cmakedefine HAVE_NAMESPACES

/* Define if you have POSIX threads libraries and header files. */
#cmakedefine HAVE_PTHREAD

/* Define to 1 if you have the <pwd.h> header file. */
#cmakedefine01 HAVE_PWD_H

/* define if the compiler implements pthread_rwlock_* */
#cmakedefine HAVE_RWLOCK

/* Define if you have the `sigaltstack' function */
#cmakedefine HAVE_SIGALTSTACK

/* Define to 1 if you have the <stdint.h> header file. */
#cmakedefine01 HAVE_STDINT_H

/* Define to 1 if you have the <stdlib.h> header file. */
#cmakedefine01 HAVE_STDLIB_H

/* Define to 1 if you have the <strings.h> header file. */
#cmakedefine01 HAVE_STRINGS_H

/* Define to 1 if you have the <string.h> header file. */
#cmakedefine01 HAVE_STRING_H

/* Define to 1 if you have the <syscall.h> header file. */
#cmakedefine01 HAVE_SYSCALL_H

/* Define to 1 if you have the <syslog.h> header file. */
#cmakedefine01 HAVE_SYSLOG_H

/* Define to 1 if you have the <sys/stat.h> header file. */
#cmakedefine01 HAVE_SYS_STAT_H

/* Define to 1 if you have the <sys/syscall.h> header file. */
#cmakedefine01 HAVE_SYS_SYSCALL_H

/* Define to 1 if you have the <sys/time.h> header file. */
#cmakedefine01 HAVE_SYS_TIME_H

/* Define to 1 if you have the <sys/types.h> header file. */
#cmakedefine01 HAVE_SYS_TYPES_H

/* Define to 1 if you have the <sys/ucontext.h> header file. */
#cmakedefine01 HAVE_SYS_UCONTEXT_H

/* Define to 1 if you have the <sys/utsname.h> header file. */
#cmakedefine01 HAVE_SYS_UTSNAME_H

/* Define to 1 if you have the <ucontext.h> header file. */
#cmakedefine01 HAVE_UCONTEXT_H

/* Define to 1 if you have the <unistd.h> header file. */
#cmakedefine01 HAVE_UNISTD_H

/* Define to 1 if you have the <unwind.h> header file. */
#cmakedefine01 HAVE_UNWIND_H

/* define if the compiler supports using expression for operator */
#cmakedefine HAVE_USING_OPERATOR

/* define if your compiler has __attribute__ */
#cmakedefine HAVE___ATTRIBUTE__

/* define if your compiler has __builtin_expect */
#cmakedefine HAVE___BUILTIN_EXPECT

/* define if your compiler has __sync_val_compare_and_swap */
#cmakedefine HAVE___SYNC_VAL_COMPARE_AND_SWAP

/* Define to the sub-directory in which libtool stores uninstalled libraries.
   */
#cmakedefine LT_OBJDIR

/* Name of package */
#define PACKAGE "glog"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "opensource@google.com"

/* Define to the full name of this package. */
#define PACKAGE_NAME "glog"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "glog 0.3.3"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "glog"

/* Define to the home page for this package. */
#define PACKAGE_URL "https://code.google.com/p/google-glog"

/* Define to the version of this package. */
#define PACKAGE_VERSION "0.3.3"

/* How to access the PC from a struct ucontext */
#cmakedefine PC_FROM_UCONTEXT

/* Define to necessary symbol if this constant uses a non-standard name on
   your system. */
#cmakedefine PTHREAD_CREATE_JOINABLE

/* The size of `void *', as computed by sizeof. */
#define SIZEOF_VOID_P @CMAKE_SIZEOF_VOID_P@

/* Define to 1 if you have the ANSI C header files. */
#cmakedefine STDC_HEADERS

/* the namespace where STL code like vector<> is defined */
#define STL_NAMESPACE std

/* location of source code */
#cmakedefine TEST_SRC_DIR

/* Version number of package */
#define VERSION "0.3.3"

/* Stops putting the code inside the Google namespace */
#define _END_GOOGLE_NAMESPACE_ @_END_GOOGLE_NAMESPACE_@

/* Puts following code inside the Google namespace */
#define _START_GOOGLE_NAMESPACE_ @_START_GOOGLE_NAMESPACE_@
