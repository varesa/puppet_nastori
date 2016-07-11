# Class: nastori_viewer
#
# This module manages nastori_viewer
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class nastori_viewer($devel = false) {
  require nastori_viewer::session
  require nastori_viewer::noblank

  class {'nastori_viewer::viewer':
  	devel => $devel
  }
}
