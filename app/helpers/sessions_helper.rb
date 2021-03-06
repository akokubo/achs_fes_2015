module SessionsHelper
	def sign_in(user)
  	remember_token = User.new_remember_token
  	cookies.permanent[:remember_token] = remember_token
  	user.update_attribute(:remember_token, User.encrypt(remember_token))
  	self.current_user = user
  end

  def signed_in?
  	!current_user.nil?
  end

  def current_user=(user)
  	@current_user = user
 	end

 	def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "ログインしてください。"
    end
  end

  def sign_out
  	self.current_user = nil
  	cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

  # 管理者だけが見えるページ
  # 管理者ユーザーであるかどうか調べる
  def admin_user
    unless signed_in? and current_user.role_id == 1
      redirect_to root_url
    end
  end

  # 出展者または管理者だけが見えるページ
  # 管理者ユーザーまたは出展者ユーザーであるかどうか調べる
  def shop_or_admin_user
    unless signed_in? && current_user.role_id != 3
      redirect_to signin_path
    end
  end

  # みんな見えるページ
  # ログインしているかどうか調べる
  def have_account
    unless signed_in?
      new_user = User.create!(name:"no_name", email:"no@name.com", password:"no_name", password_confirmation:"no_name", role_id:3)
      sign_in new_user
    end
  end

  # ログインフォームのページ
  # ログインフォームではユーザーは生成しない
  def signed_in_at_form
    if signed_in?
      sign_out
    end
  end 

end
