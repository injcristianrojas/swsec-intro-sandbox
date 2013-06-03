package 'git-core'

project_folder = File.join("/home", node[:user], "swsec-intro")

execute "git clone git://github.com/injcristianrojas/swsec-intro.git #{project_folder}" do
  not_if "ls #{project_folder}"
  user node[:user]
  group node[:user]
end

execute "gradle integrationTest" do
  cwd project_folder
  user node[:user]
  group node[:user]
end