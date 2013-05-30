require "./config"
require "./packages/base"
require "./packages/tools"
require "./packages/git"
require "./packages/user"

policy :stack, :roles => :dev do
  requires :http_proxy
  requires :base
  requires :tools
  requires :opt_user_new, :opt_user_pwd, :opt_user_keygen
  requires :git, :git_user_conf
end

deployment do
  delivery :capistrano do
    recipes 'deploy'
  end

  source do
    prefix '/usr/local' # where all source packages will be configured to install
    archives '/usr/local/sources' # where all source packages will be downloaded to
    builds '/usr/local/build' # where all source packages will be built
  end
end
