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
  # binding.pry

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
