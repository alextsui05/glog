project(glog)
cmake_minimum_required(VERSION 2.8)

include(CheckIncludeFiles)
check_include_files( stdint.h      HAVE_STDINT_H      )
check_include_files( sys/types.h   HAVE_SYSTYPES_H    )
check_include_files( inttypes.h    HAVE_INTTYPES_H    )
check_include_files( unistd.h      HAVE_UNISTD_H      )
check_include_files( syscall.h     HAVE_SYSCALL_H     )
check_include_files( sys/syscall.h HAVE_SYS_SYSCALL_H )
check_include_files( execinfo.h    HAVE_EXECINFO_H    )
check_include_files( libunwind.h   HAVE_LIBUNWIND_H   )
check_include_files( ucontext.h    HAVE_UCONTEXT_H    )
check_include_files( sys/utsname.h HAVE_SYS_UTSNAME_H )
check_include_files( pwd.h         HAVE_PWD_H         )
check_include_files( syslog.h      HAVE_SYSLOG_H      )
check_include_files( sys/time.h    HAVE_SYS_TIME_H    )
check_include_files( glob.h        HAVE_GLOB_H        )
check_include_files( unwind.h      HAVE_UNWIND_H      )

include(CheckFunctionExists)
check_function_exists( sigaltstack HAVE_SIGALTSTACK )
check_function_exists( dladdr HAVE_DLADDR )
check_function_exists( fcntl HAVE_FCNTL )

include(CheckCSourceCompiles)
check_c_source_compiles("int main() { 
    if (__builtin_expect(1,1)) { }
    return 0; 
}" HAVE___BUILTIN_EXPECT)
set(ac_cv_have___builtin_expect ${HAVE___BUILTIN_EXPECT})

check_c_source_compiles("#include <stdlib.h>
static void foo(void) __attribute__ ((unused));
static void
foo(void) {
    exit(1);
}
int main() { return 0; }" HAVE___ATTRIBUTE__)
if (HAVE___ATTRIBUTE__)
  set(ac_cv___attribute___noreturn "__attribute__ ((noreturn))")
  set(ac_cv___attribute___noinline "__attribute__ ((noinline))")
  set(ac_cv___attribute___printf_4_5 "__attribute__((__format__ (__printf__, 4, 5)))")
else( )
  set(ac_cv___attribute___noreturn "")
  set(ac_cv___attribute___noinline "")
  set(ac_cv___attribute___printf_4_5 "")
endif( )

check_c_source_compiles("int main() {
    int a;
    if (__sync_val_compare_and_swap(&a, 0, 1)) 
        return 1;
    return 0;
}" HAVE___SYNC_VAL_COMPARE_AND_SWAP)

#include(CheckLibraryExists)
#check_library_exists(pthread pthread_self "" HAVE_PTHREAD)
find_package(Threads)
if (CMAKE_USE_PTHREADS_INIT)
    set(HAVE_PTHREAD 1)
    set( CMAKE_REQUIRED_LIBRARIES ${CMAKE_THREAD_LIBS_INIT} )
    check_c_source_compiles("#define _XOPEN_SOURCE 500
        #include <pthread.h>
        int main() {
            pthread_rwlock_t l;
            pthread_rwlock_init(&l, NULL);
            pthread_rwlock_rdlock(&l);
            return 0;
        }" HAVE_RWLOCK)
    set( CMAKE_REQUIRED_LIBRARIES )
endif()

option(ENABLE_FRAME_POINTERS "On x86_64 systems, compile with -fno-omit-frame-pointer (see INSTALL)")
option(DISABLE_RTTI "Define if glog doesn't use RTTI")

if (ENABLE_FRAME_POINTERS)
    if ("${CMAKE_SIZEOF_VOID_P}" == "8")
        set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-omit-frame-pointer")
    endif( )
else( )
    add_definitions( -DNO_FRAME_POINTER )
endif( )

if(DISABLE_RTTI)
    set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti" )
endif( )

set( STL_NAMESPACE std )
set(GOOGLE_NAMESPACE "google" CACHE STRING "Name of the Google namespace (default: google)")
set(ac_google_namespace ${GOOGLE_NAMESPACE})
set(ac_google_start_namespace "namespace ${GOOGLE_NAMESPACE} {")
set(ac_google_end_namespace "}")
set(_START_GOOGLE_NAMESPACE_ ${ac_google_start_namespace})
set(_END_GOOGLE_NAMESPACE_ ${ac_google_end_namespace})

include(CheckCXXSourceCompiles)
check_cxx_source_compiles("#include <iostream>
std::ostream& operator<<(std::ostream&, struct s);
int main( ) {
    using ::operator<<;
    return 0;
}" ac_cv_cxx_using_operator)

set(ac_cv_have_stdint_h ${HAVE_STDINT_H})
set(ac_cv_have_systypes_h ${HAVE_SYSTYPES_H})
set(ac_cv_have_inttypes_h ${HAVE_INTTYPES_H})
set(ac_cv_have_unistd_h ${HAVE_UNISTD_H})

# Check for number types
set(AC_INCLUDES_DEFAULT "#include <stdio.h>")
if (HAVE_STDINT_H)
set(AC_INCLUDES_DEFAULT "${AC_INCLUDES_DEFAULT}
#include <stdint.h>")
endif( )
if (HAVE_SYSTYPES_H)
set(AC_INCLUDES_DEFAULT "${AC_INCLUDES_DEFAULT}
#include <sys/types.h>")
endif( )
if (HAVE_INTTYPES_H)
set(AC_INCLUDES_DEFAULT "${AC_INCLUDES_DEFAULT}
#include <inttypes.h>")
endif( )
check_c_source_compiles("${AC_INCLUDES_DEFAULT}
int main( ) {
    uint16_t x;
    return 0;
}" ac_cv_have_uint16_t)
check_c_source_compiles("${AC_INCLUDES_DEFAULT}
int main( ) {
    u_int16_t x;
    return 0;
}" ac_cv_have_u_int16_t)
check_c_source_compiles("${AC_INCLUDES_DEFAULT}
int main( ) {
    __uint16 x;
    return 0;
}" ac_cv_have___uint16)
if (NOT ac_cv_have___uint16)
    set (ac_cv_have___uint16 0)
endif( )

# TODO: Fix this to look for gflags library
set(ac_cv_have_libgflags 0)

configure_file(src/config.h.in.cmake config.h)
configure_file(src/glog/logging.h.in src/glog/logging.h)
configure_file(src/glog/raw_logging.h.in src/glog/raw_logging.h)
configure_file(src/glog/vlog_is_on.h.in src/glog/vlog_is_on.h)
configure_file(src/glog/stl_logging.h.in src/glog/stl_logging.h)

include_directories( BEFORE ${CMAKE_CURRENT_BINARY_DIR} )
include_directories( BEFORE ${CMAKE_CURRENT_BINARY_DIR}/src )
include_directories( BEFORE ${CMAKE_CURRENT_SOURCE_DIR}/src )

add_library(glog SHARED
    src/logging.cc
    src/raw_logging.cc
    src/vlog_is_on.cc 
    src/utilities.cc
    src/utilities.h 
    src/demangle.cc
    src/demangle.h 
    src/stacktrace.h 
    src/stacktrace_generic-inl.h 
    src/stacktrace_libunwind-inl.h 
    src/stacktrace_powerpc-inl.h 
    src/stacktrace_x86-inl.h 
    src/stacktrace_x86_64-inl.h 
    src/symbolize.cc 
    src/symbolize.h 
    src/signalhandler.cc 
    src/base/mutex.h 
    src/base/googleinit.h 
    src/base/commandlineflags.h 
    src/googletest.h
)
set(glog_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_BINARY_DIR}/src;${CMAKE_CURRENT_SOURCE_DIR}/src" CACHE INTERNAL "glog header include locations")
target_link_libraries(glog ${CMAKE_THREAD_LIBS_INIT} )
