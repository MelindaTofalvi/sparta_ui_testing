require 'capybara/dsl'
require 'faker'

class BbcRegister
	include Capybara::DSL
	include Faker

	UNDER_13 = 'Under 13'
	ABOVE_13 = '13 or over'
	EMAIL = 'email-input'
	SEND_EMAIL = 'submit-button'
	NO_PARENT_EMAIL_ERROR = 'form-message-email'
	PARENT_EMAIL = 'email-input'
	WRONG_EMAIL = 'm'


	def click_under_13
		click_link(UNDER_13)
	end

	def fill_in_email
		fill_in(EMAIL, with: Internet.email)
	end

	def click_on_send_email
		click_button(SEND_EMAIL)
	end

	def missing_parent_reg_email
		find(:id, NO_PARENT_EMAIL_ERROR).text
	end

	def wrong_parent_reg_email
		find(:id, NO_PARENT_EMAIL_ERROR).text
	end

	def click_above_13
		click_link(ABOVE_13)
	end

	def wrong_email
		fill_in(EMAIL, with: WRONG_EMAIL)
	end

end