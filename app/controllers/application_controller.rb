class ApplicationController < ActionController::Base
  before_action :set_search





  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_search
    @q = Image.rescued.search(params[:q])
  end

end
