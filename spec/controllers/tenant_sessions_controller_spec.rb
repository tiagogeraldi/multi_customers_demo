require 'rails_helper'

RSpec.describe TenantSessionsController, type: :controller do
  describe 'GET #new' do
    it 'sets session nil' do
      session[:tenant] = 'anything'
      expect {
        get :new
      }.to change {
        session[:tenant]
      }.from('anything').to(nil)
    end
  end

  describe 'POST #create' do
    it "find a customer, set session and redirect to root" do
      customer = FactoryBot.create(:customer)
      patch :create, params: { tenant: { name: customer.name } }

      expect(session[:tenant]).to eq(customer.name)
      expect(response).to redirect_to(root_path)
    end

    it "can't find a customer" do
      patch :create, params: { tenant: { name: 'unknown' } }
      
      expect(flash[:error]).to eq('Customer not found')
      expect(response).to redirect_to([:new, :tenant_session])
    end
  end
end
