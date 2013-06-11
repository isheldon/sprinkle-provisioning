package :base do
  description "Basic package applies to all machines"
  requires :update, :apt_utils, :upgrade, :sudo, :hostname
end

package :http_proxy do
  description "set http(s) proxy if needed"

  setting_file = "/root/.bashrc.d/set_http_proxy" 
  if NEED_PROXY
    transfer "assets/set_http_proxy", setting_file do
      post :install, "chmod +x #{setting_file}"
    end
  else
    runner "rm -f #{setting_file}"
  end
end

package :update do
  description "update lib sources"
  runner "apt-get update"
end 

package :upgrade do
  description "system upgrade"
  runner "apt-get --assume-yes --quiet upgrade"
end

package :apt_utils do
  description "install apt-utils"
  apt "apt-utils"

  verify do
    has_apt "apt-utils"
  end
end

package :sudo do
  description "install sudo"
  apt "sudo"

  verify do
    has_executable "sudo"
  end
end

package :hostname do
  description "set hostname"
  runner "echo #{HOSTNAME} > /etc/hostname"
end

