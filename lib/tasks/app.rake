require 'open-uri'

namespace :spacex do

  desc "Refresh SpaceX data"
  task :refresh => :environment do
    Spacex.refresh
    Rails.logger.info "SpaceX refreshed via rake task"
  end
end

desc "Refresh Blackhawks calendar"
task :blackhawks => :environment do
  Blackhawks.refresh(true)
  Rails.logger.info "Blackhawks refreshed via rake task"
end
