# Application template for MPCS 52553

def download_file(url, directory = ".", new_filename)
  inside(directory) do
    run "curl -sSl #{url} > #{new_filename}"
  end
end

remove_file "Gemfile"
run         "touch Gemfile"
add_source  'https://rubygems.org'

gem 'rails', '5.1.4'

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

run 'bundle install --without production'

comment_lines 'app/controllers/application_controller.rb', /protect_from_forgery/

download_file 'https://www.jeffcohenonline.com/templates/bootstrap-template.txt', 'app/views/layouts', 'application.html.erb'
download_file 'https://www.jeffcohenonline.com/templates/backtace-silencer.txt', 'config/initializers', 'backtrace_silencer.rb'
download_file 'https://www.jeffcohenonline.com/templates/development.rb', 'config/environments', 'development.rb'

remove_dir 'app/assets'
remove_dir 'app/jobs'

run 'rails ez:generate_yml'

git :init
git add: "-A"
git commit: "-m 'Project started.'"
