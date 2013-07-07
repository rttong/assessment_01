get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = Event.new
  erb :event_form
end

post '/events/create' do
  @event = Event.create(params[:event])
  if @event.valid?
    redirect "/events/#{@event.id}/show"
  else
    erb :event_form
    # The form remains populated with the user's input after posting?
  end
end
