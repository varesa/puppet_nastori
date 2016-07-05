class nastori_sync::s3config($access_key, $secret_key) {
    file { '/home/nastori/.s3cfg':
        ensure => 'file',
        content => template('nastori_sync/s3config.erb')
    }
}
