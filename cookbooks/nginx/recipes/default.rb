package 'nginx'

template '/etc/nginx/sites-available/default' do
  source 'default.erb'
  owner 'root'
  group 'root'
  mode 0644
end

service 'nginx' do
  action :restart
end