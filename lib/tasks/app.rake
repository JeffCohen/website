namespace :spacex do

  desc "Refresh SpaceX data"
  task :refresh => :environment do
    Spacex.refresh
    Rails.logger.info "SpaceX refreshed via rake task"
  end

end
