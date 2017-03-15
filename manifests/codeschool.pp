exec {"apt-update":
  command => '/usr/bin/apt-get update'
}

package {[
  "vim",
  "python3-dev",
  "python3-pip",
  "git-core",
  "openssl",
  "zlib1g-dev",
  ]:
  ensure => installed,
  require => Exec["apt-update"]
}

file {"python3.6":
  source => "/vagrant/manifests/python.sh",
  path => '/usr/local/bin/python.sh',
  ensure => 'file',
  owner => 'root',
  group => 'root',
  mode  => '0744',
  notify => Exec['python-script'],
}

exec {"python-script":
  command => '/usr/local/bin/python.sh',
  timeout => 0,
}

exec {"install-vm":
  command => 'pip3 install virtualenvwrapper',
  path => '/usr/bin',
  require => Exec['python-script']
}

file {"virtual-wrapper":
  source => "/vagrant/manifests/pip.sh",
  path => "/home/vagrant/pip.sh",
  ensure => 'file',
  owner => 'root',
  group => 'root',
  mode  => '0744',
  require => Exec['install-vm'],
}

file {"README":
  source => "/vagrant/README.md",
  path => '/home/vagrant/README.md',
  ensure => 'file',
  owner => 'root',
  group => 'root',
  mode  => '0777',
}

exec {"codeschool-repo":
  command => 'git clone https://github.com/MES20171CodeSchool/codeschool.git',
  path => "/usr/bin",
  require => Package['git-core']
}
