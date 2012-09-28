role :app, "a1.cloud.rubygems.org", "a4.cloud.rubygems.org", "a5.cloud.rubygems.org"
role :web, "a1.cloud.rubygems.org", "a4.cloud.rubygems.org", "a5.cloud.rubygems.org"
role :db,  "db1.cloud.rubygems.org", :primary => true

set :branch,    "cloud"
set :deploy_to, "/u/apps/rubygems.org/"
