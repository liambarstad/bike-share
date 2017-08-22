require 'pry'
class BikeShareApp < Sinatra::Base

  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/trips' do
    @trips = Trip.find_thirty_trips(1)
    erb :trip_index
  end

  post '/trips' do
    @trip = Trip.new(params)
    trip.save
    redirect'/trips'
  end

  get '/trips/new' do
    erb :trip_new
  end

  get '/trips/:id' do
    @trip = Trip.find(params["id"])
    erb :show_trip

  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params["id"])
    erb :trip_edit
  end

  put '/trips/:id/edit' do
    Trip.update(
    params[:id],
    duration: params[:duration],
    start_station: params[:start_station],
    end_station: params[:end_station],
    start_date: StartDate.find_or_create_by(date: params[:start_date]),
    end_date: EndDate.find_or_create_by(date: params[:end_date]),
    subscription_type: SubscriptionType.find_or_create_by(subscription_type:
    params[:subscription_type]),
    zip_code: ZipCode.find_or_create_by(zip_code: params[:zip_code])
    )

    redirect "/trips/#{params[:id]}"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])
    Trip.reset_ids
    redirect "/trips"
  end

  get '/stations' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    @cities = City.all
    erb :'stations/new'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  post '/stations' do
    city_name = params["city"]
    city = City.find_or_create_by(city: city_name)
    station = Station.create(params["station"])
    redirect "/stations/#{station.id}"
  end

  get '/stations/:id/edit' do |id|
    @station = Station.find(id)
    @cities = City.all
    erb :"stations/edit"
  end

  put '/stations/:id' do |id|
    @station = Station.find(id)
    city_name = params["city"]
    city = City.find_or_create_by(city: city_name)
    @station.update(params["station"])
    @station.update(city_id: city.id)
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.delete(id)
    redirect '/stations'
  end

  get '/conditions' do
    @weathers = Weather.find_thirty_conditions
    erb :weather_dashboard
  end

  get '/conditions/new' do

  end

  get '/conditions/:id' do

  end

  post '/conditions' do

  end

  get '/conditions/:id/edit' do

  end

  put '/conditions/:id' do

  end

  delete '/conditions/:id' do

  end
end
