require 'rails_helper'

RSpec.feature "Users", type: :feature do

    describe "after registering I can log in" do
      # Test to make sure that it will allow a user to go to the login page
      it "will allow me to go to the login page" do
        visit "/users/sign_in"
        fill_in 'user[email]', with: 'bob@bob.com'
        fill_in 'user[password]', with: '!Pass123word'
        click_on 'Log in'
        expect(current_path).to eq("/users/sign_in")
      end

      # Test to make sure the wrong password is not accepted
      it "will not allow me to login with the wrong password" do
        fill_form
        visit '/users/sign_in'
        fill_in 'user[email]', with: 'Bob@bob.com'
        fill_in 'user[password]', with: 'some'
        click_on 'Log in'
        expect(page).to have_content("Password is not valid")
      end
      #helper function to fill out the form and submit it
        def fill_form
          visit "/users/sign_in"
          fill_in 'user[email]', with: 'bob@bob.com'
          fill_in 'user[password]', with: '!Pass123word'
          click_on 'Log in'
        end
      end
  end
