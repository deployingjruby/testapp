# START:class_jruby
class jruby {
  $jruby_home = "/home/vagrant/opt/jruby"
  # END:class_jruby

  # START:download_jruby
  exec { "download_jruby":
    command => "wget -O jruby.tar.gz http://bit.ly/jruby165-tar-gz",
    path => $path,
    user => vagrant,
    creates => "/home/vagrant/jruby.tar.gz",
    require => Package["openjdk-6-jdk"]
  }
  # END:download_jruby

  # START:file_opt
  file { "/home/vagrant/opt":
    ensure => directory,
    owner => vagrant
  }
  # END:file_opt

  # START:unpack_jruby
  exec { "unpack_jruby" :
    command => "tar -zxf jruby.tar.gz -C /home/vagrant/opt",
    path => $path,
    user => vagrant,
    creates => "/home/vagrant/opt/jruby-1.6.5",
    require => [Exec["download_jruby"], File["/home/vagrant/opt"]]
  }
  # END:unpack_jruby

  # START:file_jruby_home
  file { $jruby_home:
      ensure => link,
      owner => vagrant,
      target => '/home/vagrant/opt/jruby-1.6.5/',
      require => Exec["unpack_jruby"]
  }
  # END:file_jruby_home
  # START:class_jruby
}
# END:class_jruby

# START:jruby_exec
define jruby::exec() {
  exec { "jruby -S ${name}" :
    path => "${jruby_home}:${path}",
    user => vagrant
  }
}
# END:jruby_exec