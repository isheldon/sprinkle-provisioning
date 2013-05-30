package :git do
  description "install git"
  apt "git"
  verify do
    has_executable "git"
  end
end

package :git_user_conf do
  description "configure git user"
  requires :git

  runner "su #{GIT_USER} -c 'git config --global user.name #{GIT_USER_NAME}'"
  runner "su #{GIT_USER} -c 'git config --global user.email #{GIT_USER_EMAIL}'"
end
