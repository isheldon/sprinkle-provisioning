package :tools do
  description "Usefull tools for most environments"
  requires :build_essential, :wget, :curl, :vim, :vim_pathogen, :vim_nerdtree 
end

package :build_essential do
  description "install build_essential"
  apt "build-essential"
  verify do
    has_apt 'build-essential'
  end 
end

package :wget do
  description 'install wget'
  apt 'wget'
  verify do
    has_executable 'wget'
  end
end

package :curl do
  description 'curl'
  apt 'curl'
  verify do
    has_executable 'curl'
  end
end

package :vim do
  description 'vim'
  apt %w(vim vim-gui-common vim-runtime)
end

package :vim_pathogen do
  description "install vim pathogen plugin"

  runner "su #{OPT_USER} -c 'mkdir -p ~/.vim/autoload ~/.vim/bundle'"
  runner "su #{OPT_USER} -c 'curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim'"

  requires :curl, :vim
end

package :vim_nerdtree do
  description "install vim nerdtree plugin"

  runner "su #{OPT_USER} -c 'cd ~/.vim/bundle; git clone https://github.com/scrooloose/nerdtree.git'"

  requires :vim_pathogen
end

