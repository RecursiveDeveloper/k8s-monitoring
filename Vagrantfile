OWNER = "vagrant"
SYNCFOLDER = "/opt/monitoring"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.boot_timeout = 600
  config.vm.synced_folder "./monitoring", "/opt/monitoring"

  config.vm.network "private_network", ip: "172.30.1.5"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "k8s-monitoring"
    vb.memory = 4096
    vb.cpus = 3
  end

  config.vm.provision "shell", path: "./provisioners/install_additional_tools.sh"
  config.vm.provision "shell", path: "./provisioners/install_docker.sh", args: "#{OWNER}"
  config.vm.provision "shell", path: "./provisioners/install_kubectl.sh"
  config.vm.provision "shell", path: "./provisioners/install_minikube.sh", args: "#{OWNER}"
  config.vm.provision "shell", path: "./provisioners/install_helm.sh", args: "#{OWNER}"
  config.vm.provision "shell", path: "./provisioners/install_manifests.sh", args: "#{OWNER} #{SYNCFOLDER}"
end
