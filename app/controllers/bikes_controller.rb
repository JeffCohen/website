class BikesController < ApplicationController

  def index
    headers['Access-Control-Allow-Origin'] = '*'
    render json: data
  end


  def get_stations
    json = open("https://feeds.divvybikes.com/stations/stations.json").read
    JSON.parse(json)['stationBeanList']
  end

end
