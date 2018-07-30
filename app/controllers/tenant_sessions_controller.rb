class TenantSessionsController < ApplicationController
  skip_before_action :tenant_session

  #layout 'devise'

  def new
    # clean any logged user up
    reset_session
  end

  def create
    if Customer.find_by(name: tenant_params[:name])
      session[:tenant] = tenant_params[:name]
      redirect_to root_path
    else
      flash[:error] = 'Customer not found'
      redirect_to [:new, :tenant_session]
    end
  end

  protected

  def tenant_params
    params.require(:tenant).permit(:name)
  end
end
