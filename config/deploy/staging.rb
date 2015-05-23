#set :deploy_to, lambda { capture("echo -n ~/staging") }
set :deploy_to, "/var/www/vhosts/lassche-lassche.nl/staging"
