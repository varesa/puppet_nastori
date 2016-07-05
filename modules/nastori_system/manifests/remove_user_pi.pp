class nastori_system::remove_user_pi {
  user { "pi":
    ensure => "absent"
  }
}
