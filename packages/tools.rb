package :git do
  description "install git"

  apt "git"

  verify do
    has_executable "git"
  end
end

package :git_user do
  description "configure git user"
  requires :git

  runner "git config --global user.name 'sheldon'"
  runner "git config --global user.email 'sheldon.xu@hp.om'"
end
