# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_kridtbot_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED kridtbot_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(kridtbot_FOUND FALSE)
  elseif(NOT kridtbot_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(kridtbot_FOUND FALSE)
  endif()
  return()
endif()
set(_kridtbot_CONFIG_INCLUDED TRUE)

# output package information
if(NOT kridtbot_FIND_QUIETLY)
  message(STATUS "Found kridtbot: 0.0.0 (${kridtbot_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'kridtbot' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT kridtbot_DEPRECATED_QUIET)
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(kridtbot_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${kridtbot_DIR}/${_extra}")
endforeach()
