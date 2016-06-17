get '/' do
  erb :'index'
end


get '/nighthawks' do
  @nighthawks = Nighthawk.all
  erb :"nighthawks/index"
end


get '/nighthawks/new' do
  require_user
  erb :"/nighthawks/new"
end


post '/nighthawks' do

  nighthawk = current_user.nighthawks.new(params[:nighthawk])
  if nighthawk.save
    redirect '/nighthawks'
  else
    # binding.pry
    @errors = nighthawk.errors.full_messages
    erb :'nighthawks/new'
  end

end


get '/nighthawks/:id' do
  require_user
  @nighthawk = Nighthawk.find(params[:id])
  erb :'nighthawks/show'
end


get '/nighthawks/:id/edit' do
  require_user
  @nighthawk = Nighthawk.find(params[:id])
  erb :'nighthawks/edit'
end


put "/nighthawks/:id" do
  binding.pry
  @nighthawk = Nighthawk.find(params[:id])
  if @nighthawk.update_attributes(params[:nighthawk])
    redirect '/nighthawks'
  else
    @errors = @nighthawk.errors.full_messages
    erb :'nighthawks/edit'
  end
end

delete '/nighthawks/:id' do
  nighthawk = Nighthawk.find(params[:id])
  nighthawk.destroy
  redirect '/nighthawks'
end
