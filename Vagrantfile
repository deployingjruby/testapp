Vagrant::Config.run do |config|
  config.vm.box = "base-jruby"

  # START:forward_80
  config.vm.forward_port("web", 80, 8000)
  # END:forward_80

  # START:provision_puppet_manifests
  # START:provision_puppet_modules
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    # END:provision_puppet_manifests
    puppet.module_path = "puppet/modules"
    # START:provision_puppet_manifests
    puppet.manifest_file = "site.pp"    
  end
  # END:provision_puppet_manifests
  # END:provision_puppet_modules
end