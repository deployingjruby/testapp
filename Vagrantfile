# START:base
Vagrant::Config.run do |config|
  # START:box
  config.vm.box = "warbler"
  # END:box

  config.vm.forward_port("web", 80, 8000)
  # END:base
  # START:forward_8080
  config.vm.forward_port("tomcat", 8080, 8888)
  # END:forward_8080

  # START:base
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "site.pp"
  end
end
# END:base