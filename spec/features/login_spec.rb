feature 'User Login by Customer' do
  before(:all) do
    @customer1 = FactoryBot.create(:customer)
    Apartment::Tenant.switch!(@customer1.name)
    @user1 = FactoryBot.create(:user)
    @post1 = FactoryBot.create(:post)

    @customer2 = FactoryBot.create(:customer)
    Apartment::Tenant.switch!(@customer2.name)
    @user2 = FactoryBot.create(:user)
    @post2 = FactoryBot.create(:post)    
  end

  scenario 'user1 can see only post1' do
    visit '/'
    fill_in 'Name', with: @customer1.name
    click_button 'Go'

    fill_in 'E-mail', with: @user1.email
    fill_in 'Password', with: '123123123'
    click_button 'Log in'

    expect(page).to have_content 'Listing posts'
    expect(page).to have_content @post1.title
    expect(page).to_not have_content @post2.title
  end
end
