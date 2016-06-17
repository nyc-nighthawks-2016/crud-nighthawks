def login?
  session[:user_id]
end

def current_user
  @user ||= User.find_by(id: session[:user_id])
end


def require_user
  redirect '/sessions/login' unless login?
end
