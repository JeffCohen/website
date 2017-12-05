# Application template for MPCS 52553

def download_file(url, directory = ".", new_filename)
  inside(directory) do
    run "curl -sSl #{url} > #{new_filename}"
  end
end

remove_file "Gemfile"
run         "touch Gemfile"
add_source  'https://rubygems.org'

gem 'ez', path: '/Users/jcohen/projects/classroom/ez'

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

gem_group :production do
  gem 'pg'
end


create_file '.ez' do <<-EOF
models: true
restful_routes: false
controllers: false
views: false
timestamps: true
EOF
end

run 'bundle install --without production --quiet'

comment_lines 'app/controllers/application_controller.rb', /protect_from_forgery/

remove_file 'README.md'
remove_dir 'app/assets'
remove_dir 'app/jobs'
remove_dir 'lib'
remove_dir 'vendor'

gsub_file 'config/routes.rb', /^# For details on the DSL.+$/, ''

application "config.time_zone = 'Central Time (US & Canada)'"

download_file 'https://www.jeffcohenonline.com/templates/bootstrap-layout.txt', 'app/views/layouts', 'application.html.erb'
download_file 'https://www.jeffcohenonline.com/templates/backtrace-silencers.rb', 'config/initializers', 'backtrace_silencers.rb'
download_file 'https://www.jeffcohenonline.com/templates/development.rb', 'config/environments', 'development.rb'
create_file "public/stylesheets/styles.css", "/* Put your style rules below. */"


run 'rails ez:generate_yml'

git add: "-A ."
git commit: "-qm 'Project started.'"

puts
puts "Your new application is ready!"
