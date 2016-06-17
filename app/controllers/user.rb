get '/users/new' do
  erb :"users/register"
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_message
    erb :'users/register'
  end
end

get '/sessions/login' do
  erb :"users/login"
end

post '/sessions' do
  user = User.find_by(email: params[:user][:email])
  if user && user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect '/'
  else
    erb :"users/login"
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end
