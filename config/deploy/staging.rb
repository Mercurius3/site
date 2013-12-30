set :stage, :staging

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.# 
role :app, 'mushu.bluerail.nl'
role :web, 'mushu.bluerail.nl'
role :db,  'mushu.bluerail.nl', primary: true

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.


# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
 set :ssh_options, {
   keys: %w(/Users/axel/.ssh/id_rsa),
   forward_agent: true,
   port: 4321,
   auth_methods: %w(publickey)
 }

# and/or per server
 # server 'mushu.bluerail.nl',
 #  user: 'lassche',
 #  roles: %w{web app},
 #  ssh_options: {
 #    user: 'lassche', # overrides user setting above
 #    keys: %w(/Users/axel/.ssh/id_rsa),
 #    forward_agent: false,
 #    auth_methods: %w(publickey password)
 #    # password: 'please use keys'
 #  }
# setting per server overrides global ssh_options
set :deploy_to, "var/www/vhosts/lassche-lassche.nl/staging"
set :tmp_dir, "var/www/vhosts/lassche-lassche.nl/staging/tmp"

fetch(:default_env).merge!(rails_env: :production)