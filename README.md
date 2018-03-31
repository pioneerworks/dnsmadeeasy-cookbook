# DnsMadeEasy Chef Cookbook

[![Build Status](https://travis-ci.org/kigster/dnsmadeeasy-cookbook.svg?branch=master)](https://travis-ci.org/kigster/dnsmadeeasy-cookbook)

This cookbook is an attempt to export the functionality of the [dnsmaseeasy](/kigster/dnsmadeeasy) ruby gem as CHEF resources with well defined actions. The cookbook automatically detects an existing record with the same attributes, and skips over.

The following resources are available:

- `dnsmadeeasy_record` — a generic record without value validation.
- `dnsmadeeasy_record_A` — an A record that validates value to be IPv4 address.
- `dnsmadeeasy_record_CNAME` — a CNAME record that validates value to be a valid hostname.

Utility:

- `dnsmadeeasy_credentials_file` — installs `~/.dnsmadeeasy/credentials.yml` file on a remote machine if necessary, optionally can use encrypted api key and secret.

## Usage

### `dnsmadeeasy_credentials_file`

You can create a credentials file on a remote server, if you need to perform DNS operations outside of Chef.

Here is how:

```ruby
# We need to set our API key/secret somewhere.
# Future versions will support encrypted data bag.

@api_key    = '134324....239f9120f'
@api_secret = 'afa998....1ffg99999'
@encr_key   = ENV['ENCRYPTION_KEY']

dnsmadeeasy_credentials_file 'my-corp' do
  api_key @api_key
  api_secret @api_secret
  encryption_key @encr_key
  action :create
end
```

### `dnsmadeeasy_record_A`

Use this to create, update, or delete an A record.

```ruby
# Let's assign this server hostname 'app001.awesome-corp.com':

dnsmadeeasy_record_A 'app001' do
  domain 'awesome-corp.com'
  value node['ipaddress']
  api_key @api_key
  api_secret @api_secret
  encryption_key @encr_key
  ttl 90
  action :create
end
```

### `dnsmadeeasy_record_CNAME`

This resource creates/updates/deletes CNAMEs to other hosts:

```ruby
# Let's add this server's name to the CNAME www.
#
# This would only work, if server's name has been added as a valid A record 
# also.
#
dnsmadeeasy_record_CNAME www do
  domain 'awesome-corp.com'
  value node['name']
  api_key @api_key
  api_secret @api_secret
  encryption_key @encr_key
  ttl 90
  action :create
end
```

## Development

After checking out the repo, run `bundle` and `berks` to install dependencies. 

Then, run `chef exec rspec ` to run the unit tests.

To run integration tests:

```bash
kitchen create
kitchen converge
```

For both sets of tests to pass, you must set the `DME_KEY` environment variable that decrypts the credentials. 

Most likely, you'll want to use your own account keys instead.
 
## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/kigster/dnsmadeeasy-cookbook](https://github.com/kigster/dnsmadeeasy-cookbook).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


