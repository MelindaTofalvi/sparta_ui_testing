require 'capybara/dsl'

class BbcRegistrationForm
	include Capybara::DSL

	REGISTER = 'submit-button'
	EMAIL_ERROR_MESSAGE = 'form-message-email'
	PASSWORD_ERROR_MESSAGE = 'form-message-password'
	POSTCODE_ERROR_MESSAGE = 'form-message-postcode'
	UPDATES_ERROR_MESSAGE = 'form-message-marketingOptIn'
	GENDER_ERROR_MESSAGE = 'form-message-gender'

	def register
		click_button(REGISTER)
	end

	def email_error_message
		find(:id, EMAIL_ERROR_MESSAGE).text
	end

	def password_error_message
		find(:id, PASSWORD_ERROR_MESSAGE).text
	end

	def postcode_error_message
		find(:id, POSTCODE_ERROR_MESSAGE).text
	end

	def gender_error_mesage
		find(:id, GENDER_ERROR_MESSAGE).text
	end

	def updates_error_message
		find(:id, GENDER_ERROR_MESSAGE).text
	end	
end