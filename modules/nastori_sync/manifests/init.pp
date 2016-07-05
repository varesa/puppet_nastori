# Class: nastori_system
#
# This module manages nastori_system
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class nastori_sync {
    require nastori_sync::displayid
    require nastori_sync::s3config
    require nastori_sync::sync
    require nastori_sync::server
}
