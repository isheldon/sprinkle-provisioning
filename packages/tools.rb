package :tools do
  description "Usefull tools for most environments"
  requires :build_essential, :wget, :curl, :vim
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
  apt 'vim'
  verify do
    has_executable 'vim'
  end
end

