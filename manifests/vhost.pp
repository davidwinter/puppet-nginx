# == Define: nginx::vhost
#
# See README.md
#
define nginx::vhost (
  $ensure      = 'present',
  $root        = '/var/www',
  $priority    = '50',
  $file        = $name,
  $server_name = $name,
  $index       = 'index.html',
  $template    = 'nginx/vhost.conf.erb',
) {
  include nginx

  $link_ensure = $ensure ? {
    'present' => 'link',
    default => 'absent',
  }

  $file_ensure = $ensure ? {
    'present' => 'file',
    default => 'absent',
  }

  file { "/etc/nginx/sites-available/${priority}-${file}.conf":
    ensure  => $file_ensure,
    content => template($template),
    require => File["/etc/nginx/sites-enabled/${priority}-${file}.conf"],
    notify  => Service['nginx'],
  }

  file { "/etc/nginx/sites-enabled/${priority}-${file}.conf":
    ensure  => $link_ensure,
    target  => "/etc/nginx/sites-available/${priority}-${file}.conf",
    require => Package['nginx'],
  }
}