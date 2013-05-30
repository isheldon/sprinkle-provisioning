package :base do
  description "Basic package applies to all machines"
  requires :update, :upgrade, :sudo
end

package :http_proxy do
  description "set http(s) proxy"

  runner "export http_proxy=http://proxy.houston.hp.com:8080"
  runner "export https_proxy=http://proxy.houston.hp.com:8080"
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
