package opt_user_new do
  description "create user for daily operator"

  runner "useradd --create-home --shell /bin/bash --user-group --groups users,sudo #{OPT_USER}"

  verify do
    has_directory "/home/#{OPT_USER}"
  end
end

package opt_user_pwd do
  description "set operator user password"
  requires :opt_user_new

  runner "echo '#{OPT_USER}:#{OPT_USER_PWD}' | chpasswd"
end

package opt_user_authkeys do
  description "set operator user authorizedkeys file"
  requires :opt_user_new

  ssh_dir = "/home/#{OPT_USER}/.ssh"
  authkeys_file = "#{ssh_dir}/authorized_keys"
  transfer "assets/authkeys" authkeys_file do
    pre :install "mkdir #{ssh_dir}"
    post :install "chmod 0600 #{authkeys_file}"
    post :install "chown -R #{OPT_USER}:#{OPT_USER} #{ssh_dir}"
  end
end

package opt_user_keygen do
  description "generate user ssh key"
  requires :opt_user_new

  runner "su #{OPT_USER} -c \"ssh-keygen -f ~/.ssh/id_rsa -N ''\""

  verfiy do
    has_file "/home/#{OPT_USER}/.ssh/id_rsa"
  end
end

