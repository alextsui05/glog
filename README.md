This repository contains a fork of version 0.3.3 of glog, a C++ implementation
of the Google logging module.  See [here](https://code.google.com/p/google-glog/) for the original project page on Google Code. Documentation for the implementation is in doc/.

Installation
-----

This version of glog introduces a CMake build system for easy integration into
existing CMake projects. Suppose you clone this into the `glog` subdirectory of
your project, then should be able to add this into an existing project:

    add_subdirectory( glog )
    include_directories( BEFORE ${glog_INCLUDE_DIRECTORIES} )
    ...
    target_link_libraries( my_app glog )

So far, this has only been tested on Ubuntu Linux 14.04.

License
-----
This project retains the license of the original project: [the BSD 3-Clause License](http://opensource.org/licenses/BSD-3-Clause).
