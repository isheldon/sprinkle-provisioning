require "./packages/update"
require "./packages/git"

policy :stack, :roles => :dev do
  requires :apt_update
  requires :git
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
