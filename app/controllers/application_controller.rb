class ApplicationController < ActionController::Base
  before_action :tenant_session

  private

  def tenant_session
    if !session[:tenant]
      redirect_to [:new, :tenant_session]
    end
  end
end
