# ┌─┐┬ ┬┬─┐┌─┐┬─┐┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┬ ┬┌─┐┬─┐┬┌─
# ├─┤│ │├┬┘│ │├┬┘├─┤  ├┤ ├┬┘├─┤│││├┤ ││││ │├┬┘├┴┐
# ┴ ┴└─┘┴└─└─┘┴└─┴ ┴  └  ┴└─┴ ┴┴ ┴└─┘└┴┘└─┘┴└─┴ ┴
# A Powerful General Purpose Framework
# More information in: https://aurora-fw.github.io/
#
# Copyright (C) 2017 Aurora Framework, All rights reserved.
#
# This file is part of the Aurora Framework. This framework is free
# software; you can redistribute it and/or modify it under the terms of
# the GNU Lesser General Public License version 3 as published by the
# Free Software Foundation and appearing in the file LICENSE included in
# the packaging of this file. Please review the following information to
# ensure the GNU Lesser General Public License version 3 requirements
# will be met: https://www.gnu.org/licenses/lgpl-3.0.html.

################################################################################
# sndfile package finder
################################################################################
# Find the native sndfile includes and library
#
# This module defines
# sndfile_INCLUDE_DIR, the sndfile include directories 
# sndfile_LIBRARIES, link these to use sndfile
# sndfile_FOUND, system has sndfile

if(NOT DEFINED SNDFILE_MODULE_LOADED)
set(SNDFILE_MODULE_LOADED true)
IF(NOT DEFINED AURORAFW_IS_BUILDING)
	find_package(AuroraFWBuild REQUIRED)
ENDIF()

findpkg_begin(sndfile)

getenv_path(SNDFILE_HOME)

set(sndfile_PREFIX_PATH ${sndfile_HOME} ${ENV_sndfile_HOME})
create_search_paths(sndfile)

clear_if_changed(sndfile_PREFIX_PATH
	sndfile_LIBRARY_FWK
	sndfile_LIBRARY_REL
	sndfile_LIBRARY_DBG
	sndfile_INCLUDE_DIR
)

set(sndfile_LIBRARY_NAMES sndfile sndfileLib)
get_debug_names(sndfile_LIBRARY_NAMES)

findpkg_framework(sndfile)

find_path(sndfile_INCLUDE_DIR NAMES sndfile.h HINTS ${sndfile_INC_SEARCH_PATH} ${sndfile_PKGC_INCLUDE_DIRS})

find_library(sndfile_LIBRARY_REL NAMES ${sndfile_LIBRARY_NAMES} HINTS ${sndfile_LIB_SEARCH_PATH} ${sndfile_PKGC_LIBRARY_DIRS} PATH_SUFFIXES "" Release RelWithDebInfo MinSizeRel)
find_library(sndfile_LIBRARY_DBG NAMES ${sndfile_LIBRARY_NAMES_DBG} HINTS ${sndfile_LIB_SEARCH_PATH} ${sndfile_PKGC_LIBRARY_DIRS} PATH_SUFFIXES "" Debug)

make_library_set(sndfile_LIBRARY)

findpkg_finish(sndfile)

endif(NOT DEFINED SNDFILE_MODULE_LOADED)