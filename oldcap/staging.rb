set :deploy_to, lambda { capture("echo -n ~/staging") }
