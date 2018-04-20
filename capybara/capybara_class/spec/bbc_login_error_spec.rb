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

 	context 'it should respond with the correct error at registration when someone under 13 yrs tries to register with missing/incorrect details' do

 		it 'should give the correct error when the user who wants to register is under 13 yrs and no details are given' do

	 		@homepage.visit_home_page
			@homepage.click_sign_in_link
			@sign_in_page.click_register
			@register.click_under_13
			@register.click_on_send_email

			expect(@register.missing_parent_reg_email).to eq "Something's missing. Please check and try again."
 		end

 		it 'should give the correct error when the user who wants to register is under 13 yrs and didn\'t give correct email address' do
 			@homepage.visit_home_page
			@homepage.click_sign_in_link
			@sign_in_page.click_register
			@register.click_under_13
			@register.fill_in_email('m')
			@register.click_on_send_email

			expect(@register.wrong_parent_reg_email).to eq "Sorry, that doesn't look right. Please check it's a proper email."
 		end

 	end

 	context 'it should successfully go through the registration process when the new user is under 13' do

 		it 'should give the correct message when successfully registering someone under 13 yrs' do

 			@homepage.visit_home_page
			@homepage.click_sign_in_link
			@sign_in_page.click_register
			@register.click_under_13
			@register.fill_in_email('ma@freemail.com')
			@register.click_on_send_email

			expect(@registered.successful_reg_message).to eq "Email sent. Now check your inbox and follow the instructions"
 		end

 	end

 	context 'it should give the correct error when trying to register as user above 13 yrs' do

 		it 'should give the correct error when date of birth data missing' do
 			@homepage.visit_home_page
			@homepage.click_sign_in_link
			@sign_in_page.click_register
			@register.click_above_13
			@register_date_of_birth.click_continue

			expect(@register_date_of_birth.error_message).to eq "Oops, that date doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
 		end

 		it 'should give the correct error when some of the data missing' do
 			@homepage.visit_home_page
			@homepage.click_sign_in_link
			@sign_in_page.click_register
			@register.click_above_13
			@register_date_of_birth.fill_in_day(3)
			@register_date_of_birth.fill_in_month(12)
			#@register_date_of_birth.fill_in_year(1988)
			@register_date_of_birth.click_continue

			expect(@register_date_of_birth.error_message).to eq "Oops, that year doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
 		end
 	end

 	context 'it should respond with the correct error when user doesn\'t fill in the registration form correctly' do

 		it 'should respond with the correct error when no details are given' do
 			@homepage.visit_home_page
			@homepage.click_sign_in_link
			@sign_in_page.click_register
			@register.click_above_13
			@register_date_of_birth.fill_in_day(3)
			@register_date_of_birth.fill_in_month(12)
			@register_date_of_birth.fill_in_year(1988)
			@register_date_of_birth.click_continue
			@registration_form.register

			expect(@registration_form.email_error_message).to eq "Something's missing. Please check and try again."
			expect(@registration_form.password_error_message).to eq "Something's missing. Please check and try again."
			expect(@registration_form.postcode_error_message).to eq "Something's missing. Please check and try again."
			expect(@registration_form.gender_error_mesage).to eq "Something's missing. Please check and try again."
			expect(@registration_form.updates_error_message).to eq "Something's missing. Please check and try again."

 		end

 	end

end



# Sorry, those details don't match. Check you've typed them correctly.

# Something's missing. Please check and try again.

# Something's missing. Please check and try again.