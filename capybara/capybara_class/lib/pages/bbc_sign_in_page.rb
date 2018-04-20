require 'capybara/dsl'

class BbcSignInPage
	include Capybara::DSL

	USERNAME_ID = 'user-identifier-input'
	PASSWORD_ID = 'password-input'
	SUBMIT = 'submit-button'
	USERNAME_ERROR_MESSAGE = 'form-message-username'
	GENERAL_ERROR_MESSAGE = 'form-message-general'
	PASSWORD_ERROR_MESSAGE = 'form-message-password'
	REGISTER = 'Register now'


	def fill_in_username(username)
		fill_in(USERNAME_ID, :with => username)
	end

	def fill_in_password(password)
		fill_in(PASSWORD_ID, :with => password)
	end

	def click_sign_in_button
		click_button(SUBMIT)
	end

	def incorrect_password_text
		find(:id, USERNAME_ERROR_MESSAGE).text	
	end

	def check_username_error_message
		find(:id, USERNAME_ERROR_MESSAGE).text
	end

	def check_general_error_message
		find(:id, GENERAL_ERROR_MESSAGE).text
	end

	def check_password_error_message
		find(:id, PASSWORD_ERROR_MESSAGE).text
	end

	def click_register
		click_link(REGISTER)
	end

end