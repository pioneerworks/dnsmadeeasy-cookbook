record_name = node['dnsmadeeasy_test']['hostname']

dnsmadeeasy_record_A record_name do
  domain node['dnsmadeeasy_test']['domain']
  value node['ipaddress']
  api_key node['dnsmadeeasy_test']['api_key']
  api_secret node['dnsmadeeasy_test']['api_secret']
  encryption_key node['dnsmadeeasy_test']['encryption_key']
  ttl 90
  action :create
end

dnsmadeeasy_record_A record_name do
  domain node['dnsmadeeasy_test']['domain']
  api_key node['dnsmadeeasy_test']['api_key']
  api_secret node['dnsmadeeasy_test']['api_secret']
  encryption_key node['dnsmadeeasy_test']['encryption_key']
  value '1.1.1.1'
  ttl 120
  action :update
end

dnsmadeeasy_record_A record_name do
  domain node['dnsmadeeasy_test']['domain']
  api_key node['dnsmadeeasy_test']['api_key']
  api_secret node['dnsmadeeasy_test']['api_secret']
  encryption_key node['dnsmadeeasy_test']['encryption_key']
  action :delete
end


