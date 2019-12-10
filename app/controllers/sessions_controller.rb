class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_to root_path, notice: "ログインしました"
    else
      render :new
    end
  end

  def destroy
    current_list.destroy
    logout
    redirect_to new_session_path
  end

end
