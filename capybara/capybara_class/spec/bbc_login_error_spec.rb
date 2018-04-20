require 'spec_helper'

describe 'Incorrect user details produces valid error' do 

	before(:all) do 
		@bbc_site = BbcSite.new
		@homepage = @bbc_site.bbc_homepage
		@sign_in_page =	@bbc_site.bbc_sign_in_page
		@register = @bbc_site.bbc_register
		@registered = @bbc_site.bbc_successfully_registered
		@register_date_of_birth = @bbc_site.bbc_register_date_of_birth
		@registration_form = @bbc_site.bbc_registration_form
	end

	context 'it should respond with correct error when incorrect details are input' do 

		it 'should produce an error when inputting an incorrect password to a invalid account' do
			@homepage.visit_home_page
			@homepage.click_sign_in_link
			@sign_in_page.fill_in_username('dszfxsdgdfgdf')
			@sign_in_page.fill_in_password('safsezddrfcdxrfc5555')
			@sign_in_page.click_sign_in_button

			expect(@sign_in_page.incorrect_password_text).to eq "Sorry, we can’t find an account with that username. If you're over 13, try your email address instead or get help here."
		end

	end

	context 'it should respond with the correct error when no details are entered' do

		it 'should produce three errors when no username or password is entered' do
			@homepage.visit_home_page
			@homepage.click_sign_in_link
			@sign_in_page.click_sign_in_button

			expect(@sign_in_page.check_general_error_message).to eq "Sorry, those details don't match. Check you've typed them correctly."
			expect(@sign_in_page.check_password_error_message).to eq "Something's missing. Please check and try again."
			expect(@sign_in_page.check_username_error_message).to eq "Something's missing. Please check and try again."
		end

 	end

 	context 'it should respond with the correct error when the username and password are both too short(less than 2 characters)' do

 		it 'should produce two errors when the username and password are both too short(less than 2 characters)' do
 			@homepage.visit_home_page
			@homepage.click_sign_in_link
			@sign_in_page.fill_in_username('m')
			@sign_in_page.fill_in_password('1')
			@sign_in_page.click_sign_in_button

			expect(@sign_in_page.check_password_error_message.length).to be >= 2
			expect(@sign_in_page.check_username_error_message.length).to be >= 2
 		end

 	end

end