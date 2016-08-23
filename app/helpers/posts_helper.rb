module PostsHelper

  def current_user_is_owner?
    session[:user_id] == @post.user_id
  end

end
