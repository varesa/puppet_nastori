class nastori_system::create_user {
  include nastori_system::params

user { "${nastori_system::params::user}":
    managehome => true,
    home       => "${nastori_system::params::homedir}",
    password   => "${nastori_system::params::password}"
}

#  exec { "create_user":
#    command => "adduser -p \"${nastori_system::params::password}\" -d ${nastori_system::params::homedir} ${nastori_system::params::user}",
#    path    => "/usr/sbin/",
#    unless => "/usr/bin/test -d $nastori_viewer::params::homedir"
#  }

#  exec { "set root pw":
#    command => "/bin/bash -c \"echo 'root:$1$jmsLLg8Z$NxqWlWJqnBJpkpurhwQFW0 | chpasswd'\"",
#  }

}
