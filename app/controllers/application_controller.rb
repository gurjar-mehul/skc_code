class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def per_page
    params[:per_page] || 10
  end

  def page_count
    params[:page] || 1
  end
end
