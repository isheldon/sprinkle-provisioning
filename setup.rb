require "./config"
require "./packages/base"
require "./packages/tools"
require "./packages/user"
require "./packages/git"
require "./packages/langs"
require "./packages/java_tools"

policy :basic, :roles => :dev do
  requires :http_proxy
  requires :base

  requires :opt_user_new
  requires :opt_user_pwd
  requires :opt_user_keygen

  requires :tools

  requires :git
  requires :git_user_conf

  requires :openjdk_7
  requires :ruby

  requires :apache_maven
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
