package :apache_maven do
  description "insall apache maven 3"
  requires :wget

  # install
  install_pgm = "/tmp/install_maven.sh"
  transfer "assets/install_maven.sh", install_pgm do
    post :install, "chmod +x #{install_pgm}"
    post :install, "#{install_pgm}"
  end

  # configure
  transfer "assets/maven_settings.xml", "/tmp/maven_settings.xml"
  config_pgm = "/tmp/config_maven.sh"
  transfer "assets/config_maven.sh", config_pgm do
    post :install, "chmod +x #{config_pgm}"
    post :install, "#{config_pgm} #{NEXUS_URL}"
  end

  verify do
    has_executable "mvn"
  end
end
