require 'capybara/dsl'

class BbcSignInPage
	include Capybara::DSL

	USERNAME_ID = 'user-identifier-input'
	PASSWORD_ID = 'password-input'
	SUBMIT = 'submit-button'

	def fill_in_username(username)
		#p 'hello'
		fill_in(USERNAME_ID, :with => username)
		sleep 2
	end

	def fill_in_password(password)
		fill_in(PASSWORD_ID, :with => password)
		sleep 2
	end

	def click_sign_in_button
		click_button(SUBMIT)
	end

	def incorrect_password_text
		sleep 2
		"Sorry, we can\'t find an account with that username. If you\'re over13, try your email address instead of get help here."
		
	end



end