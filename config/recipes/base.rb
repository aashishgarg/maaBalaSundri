def set_user
  default_user = 'deploy'
  STDOUT.puts "username (Default is #{default_user}) :"
  user = STDIN.gets.strip
  user = default_user if user.empty?
  user
end

def set_branch
  default_branch = `git rev-parse --abbrev-ref HEAD`.chomp
  STDOUT.puts "Branch to deploy (Default:- #{default_branch}) :"
  branch = STDIN.gets.strip
  branch = default_branch if branch.empty?
  branch
end

def ask_sudo
  STDOUT.print "\nPlease enter SUDO password: "
  STDIN.gets.strip
end

def repository_url
  STDOUT.print "\nBitbucket's Git Username: "
  _user_name = STDIN.gets.strip
  STDOUT.print "\nBitbucket's Git Password: "
  _password = STDIN.noecho(&:gets).strip
  "https://#{_user_name}:#{_password}@git@bitbucket.org:ashishgarg/maabalasundri.git"
end