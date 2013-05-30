package opt_user do
  description "create user for daily operator"

  runner "useradd --create-home --shell /bin/bash --user-group --groups users,sudo #{OPT_USER}"
  runner "echo '#{OPT_USER}:#{OPT_USER_PWD}' | chpasswd"

  verify do
    has_directory "/home/#{OPT_USER}"
  end
end
