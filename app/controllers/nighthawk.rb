get '/' do
  redirect '/nighthawks'
end


get '/nighthawks' do
  @nighthawks = Nighthawk.all
  erb :"nighthawks/index"
end


get '/nighthawks/new' do
  erb :"/nighthawks/new"
end


post '/nighthawks' do

  nighthawk = Nighthawk.new(params)
  if nighthawk.save
    redirect '/nighthawks'
  else
    # binding.pry
    @errors = nighthawk.errors.full_messages
    erb :'nighthawks/new'
  end

end


get '/nighthawks/:id' do
  @nighthawk = Nighthawk.find(params[:id])
  erb :'nighthawks/show'
end


get '/nighthawks/:id/edit' do
  @nighthawk = Nighthawk.find(params[:id])
  erb :'nighthawks/edit'
end


put "/nighthawks/:id" do
  binding.pry
  @nighthawk = Nighthawk.find(params[:id])
  if @nighthawk.update_attributes(params[:nighthawk])
    redirect '/'
  else
    @errors = @nighthawk.errors.full_messages
    erb :'nighthawks/edit'
  end
end

delete '/nighthawks/:id' do
  nighthawk = Nighthawk.find(params[:id])
  nighthawk.destroy
  redirect '/'
end
