class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  helper_method :current_list

  def current_list
    begin
      List.find(session[:list_id])
    rescue
      list = List.create(user_id: current_user.id)
      session[:list_id] = list.id
      return list
    end
  end

private

def not_authenticated
  redirect_to new_session_path
end

end
