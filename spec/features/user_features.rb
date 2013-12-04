require 'spec_helper'

describe "the signin process", type: :feature, js: true do
  before :each do
    @user = build(:user)
    @user.confirm!
    create(:page)
    visit '/users/sign_in'
    within("#main_content") do
      fill_in 'Mailadres', with: @user.email
      fill_in 'Wachtwoord', with: @user.password
    end
    click_button 'Inloggen'
  end

  it "signs me in" do
    expect(page).to have_content 'succesvol'
  end
  
  it "doesn't allow me to use somebody else's email" do
    click_link 'mijn account'
    expect(page).to have_content 'Wijzig mailadres'
    click_link 'Wijzig mailadres'
    expect(page).to have_content 'Uw mailadres'
    @user_other = build(:user, email: "somebody@else.me")
    @user_other.confirm!
    fill_in 'Uw mailadres', with: @user_other.email
    click_button 'Wijzigingen opslaan'
    within("#confirm_changes") do
      fill_in 'Uw huidige wachtwoord', with: @user.password
      click_button 'Bijwerken'
    end
    expect(page).to have_content 'dit mailadres is al in gebruik'
  end
  
  it "doesn't allow me to use an invalid postal code" do
    click_link 'mijn account'
    click_link 'Wijzig adresgegevens'
    fill_in 'Postcode', with: "222AAA"
    click_button 'Wijzigingen opslaan'
    click_button 'Bijwerken'
    expect(page).to have_content 'Vul hier een geldige postcode in'
  end
end