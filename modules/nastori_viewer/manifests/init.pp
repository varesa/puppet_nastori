
class nastori_viewer($devel = false, $reboot = false) {
  require nastori_viewer::session
  require nastori_viewer::noblank

  class {'nastori_viewer::viewer':
  	devel => $devel
  }
}
