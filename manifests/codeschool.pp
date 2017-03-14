exec {"apt-update":
  command => '/usr/bin/apt-get update'
}

package {[
  "vim",
  "python3-dev",
  "git-core",
  "openssl",
  ]:
  ensure => installed,
  require => Exec["apt-update"]
}

file {"python3.6":
  source => "/vagrant/manifests/python3.6.sh",
  path => '/usr/local/bin/python3.6.sh',
  ensure => 'file',
  owner => 'root',
  group => 'root',
  mode  => '0744',
  notify => Exec['python-script'],
}

exec {"python-script":
  command => '/usr/local/bin/python3.6.sh',
}

/* exec {"codeschool-repo": */
/*   command => 'git clone https://github.com/MES20171CodeSchool/codeschool.git', */
/*   path => "/usr/bin", */
/*   require => Package['git-core'] */
/* } */
