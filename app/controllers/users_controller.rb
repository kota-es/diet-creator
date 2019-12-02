class UsersController < ApplicationController

  before_action :redirect_login, only: :index

  def index    
  end

  def new
    @user = User.new
  end

  def profile_registration
    session[:name] = user_params[:name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new
  end

  def create
    @user = User.new(
      name: session[:name],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      image: user_params[:image],
      gender: user_params[:gender],
      height: user_params[:height],
      weight: user_params[:weight],
      pal: user_params[:pal],
      birthday: birthday
    )
    if  @user.save
      login(session[:email], session[:password])
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to root_path
    else
      render :new
    end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :gender, :height, :weight, :pal, :birthday)
  end

  def birthday
    year = params[:user]["birthday(1i)"]
    month = params[:user]["birthday(2i)"]
    day = params[:user]["birthday(3i)"]
    
    if year.empty? || month.empty? || day.empty?
      return
    end
    
    Date.new(year.to_i, month.to_i, day.to_i)
  end

  def redirect_login
    redirect_to new_session_path unless logged_in?
  end

end
