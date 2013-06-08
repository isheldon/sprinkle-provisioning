package :apache_maven do
  description "insall apache maven 3"
  requires :wget

  install_pgm = "/tmp/install_maven.sh"
  transfer "assets/install_maven.sh", install_pgm do
    post :install, "chmod +x #{install_pgm}"
    post :install, "#{install_pgm}"
  end

  verify do
    has_executable "mvn"
  end
end
