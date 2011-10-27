require 'bundler/setup'
require 'net/ssh'
require 'net/scp'

SSH_KEY = "#{ENV["GEM_HOME"]}/gems/vagrant-0.8.7/keys/vagrant"

def prod_ssh
  Net::SSH.start("localhost", "vagrant", {
      :port => 2222, :keys => [SSH_KEY]
  }) do |ssh|
    yield ssh
  end
end

def prod_scp(local_file, remote_file)
  Net::SCP.upload!("localhost", "vagrant", local_file, remote_file, {
      :ssh => {:port => 2222, :keys => [SSH_KEY]}
  }) do |ch, name, sent, total|
    print "\rCopying #{name}: #{sent}/#{total}"
  end
  print "\n"
end

namespace :deploy do
  desc "Package the application into a WAR file and deploy it"
  task :war do
    # START:prepare
    prod_ssh do |ssh|
      ssh.exec! "mkdir -p deploy/"
      ssh.exec! "rm -rf deploy/*"
    end
    # END:prepare

    # START:scp_war
    prod_scp("twitalytics.war", "deploy/")
    # END:scp_war

    # START:migrate
    prod_ssh do |ssh|
      ssh.exec! "cd deploy; jar xf twitalytics.war"
      ssh.exec("source .rvm/scripts/rvm
                cd deploy/WEB-INF
                RAILS_ENV=production rake db:migrate"
      ) do |ch, stream, data|
        puts data
      end
    end
    # END:migrate

    # START:depoy_tomcat
    #prod_ssh("mv stage/twitalytics.war /var/lib/tomcat6/webapps/")
    # END:deploy_tomcat
  end
end