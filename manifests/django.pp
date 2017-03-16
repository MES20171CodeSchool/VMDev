exec {"apt-update":
  command => '/usr/bin/apt-get update'
}

package {[
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

file {".bashrc":
  source => "/vagrant/manifests/.bashrc",
  path => '/home/vagrant/.bashrc',
  ensure => 'file',
  owner => 'root',
  group => 'root',
  mode  => '0777',
  require => Exec['install-vm']
}

file {".bash_git":
  source => "/vagrant/manifests/.bash_git",
  path => '/home/vagrant/.bash_git',
  ensure => 'file',
  owner => 'root',
  group => 'root',
  mode  => '0777',
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
  command => 'git clone https://github.com/MES20171CodeSchool/cs-server.git',
  path => "/usr/bin",
  require => Package['git-core']
}

file {"vim":
  source => "/vagrant/manifests/vim.sh",
  path => '/home/vagrant/vim.sh',
  ensure => 'file',
  owner => 'root',
  group => 'root',
  mode  => '0744',
}

file {"atom":
  source => "/vagrant/manifests/atom.sh",
  path => '/usr/local/bin/atom.sh',
  ensure => 'file',
  owner => 'root',
  group => 'root',
  mode  => '0744',
  notify => Exec['atom-script'],
}

exec {"atom-script":
  command => '/usr/local/bin/atom.sh',
  timeout => 0,
}
