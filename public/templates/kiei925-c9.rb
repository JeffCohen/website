# Application template for MPCS 52553

def download_file(url, directory = ".", new_filename)
  inside(directory) do
    run "curl -sSl #{url} > #{new_filename}"
  end
end

remove_file "Gemfile"
run         "touch Gemfile"
add_source  'https://rubygems.org'

gem 'ez'

gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'

gem_group :development, :test do
  gem 'sqlite3'
end

gem_group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# gem_group :production do
#   gem 'pg', '0.20'
# end

create_file '.ez' do <<-EOF
models: true
restful_routes: false
controllers: true
views: false
timestamps: true
EOF
end

run 'bundle install --without production --quiet'

comment_lines 'app/controllers/application_controller.rb', /protect_from_forgery/
gsub_file 'config/routes.rb', /^require \'bootsnap\/setup\' # Speed up boot time by caching expensive operations\.$/, ''


remove_file 'README.md'
remove_dir 'app/jobs'
remove_dir 'app/helpers'
remove_dir 'app/controllers/concerns'
remove_dir 'app/models/concerns'
remove_dir 'lib'
remove_dir 'vendor'

gsub_file 'config/routes.rb', /^\s*# For details on the DSL.+$/, ''

application "config.time_zone = 'Central Time (US & Canada)'"

download_file 'https://www.jeffcohenonline.com/templates/kiei925-layout.txt', 'app/views/layouts', 'application.html.erb'
download_file 'https://www.jeffcohenonline.com/templates/backtrace-silencers.rb', 'config/initializers', 'backtrace_silencers.rb'
download_file 'https://www.jeffcohenonline.com/templates/development.rb', 'config/environments', 'development.rb'
create_file "app/assets/stylesheets/styles.css", "/* Put your style rules here. */"


run 'rails ez:generate_yml'

git add: "-A ."
git commit: "-qm 'Project started.'"
