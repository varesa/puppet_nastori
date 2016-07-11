class nastori_viewer::viewer ($devel = false){
	if($devel == true) {
		require nastori_viewer::viewer_dev
	} else {
		require nastori_viewer::viewer_bin
	}
}