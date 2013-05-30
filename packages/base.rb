package :base do
  description "Basic package applies to all machines"
  requires :update, :upgrade, :sudo
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
