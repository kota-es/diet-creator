class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :profile_registration, :create]
  before_action :set_user, only: [:edit, :profile_edit, :update]

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
      set_up_record
      redirect_to root_path, notice: "ユーザー登録が完了しました"
    else
      render :new
    end
  end

  def edit
  end

  def profile_edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "アカウントデータを更新しました"
    else
      render :edit
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

  def set_user
    @user = User.find(params[:id])
  end

end
