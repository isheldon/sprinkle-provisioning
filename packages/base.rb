package :base do
  description "Basic package applies to all machines"
  requires :update, :upgrade, :sudo
end

package :http_proxy do
  description "set http(s) proxy if needed"

  if NEED_PROXY
    setting_file = "/root/.bashrc.d/set_http_proxy" 
    transfer "assets/set_http_proxy", setting_file do
      post :install, "chmod +x #{setting_file}"
    end
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

package :sudo do
  description "install sudo"
  apt "sudo"

  verify do
    has_apt "sudo"
  end
end
