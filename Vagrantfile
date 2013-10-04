# -*- mode: ruby -*-
# vi: set ft=ruby :

HERE = File.join(File.dirname(__FILE__))

Vagrant::Config.run do |config|

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.define "production" do |cfg|
    cfg.vm.network :hostonly, "192.168.0.10"
    cfg.vm.forward_port 80, 8080
    cfg.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = File.join(HERE, 'cookbooks')
      chef.add_recipe("apt")
      chef.add_recipe("postgresql::server")
      chef.json = {
          :postgresql => {
              :version  => "9.1",
              :listen_addresses => "*",
              :pg_hba => [
                  "local all all md5",
              ],
              :users => [
                  { :username => "postgres", :password => "password",
                    :superuser => true, :login => true, :createdb => true }
              ],
          }
      }
    end
  end

end
