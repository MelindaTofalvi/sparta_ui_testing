require 'capybara/dsl'

class BbcRegisterDateOfBirth

	include Capybara::DSL

	SUBMIT = 'submit-button'
	ERROR_MESSAGE = 'form-message-dateOfBirth'
	DAY = 'day-input'
	MONTH = 'month-input'
	YEAR = 'year-input'

	def click_continue
		click_button(SUBMIT)
	end

	def error_message
		find(:id, ERROR_MESSAGE).text
	end

	def fill_in_day(day)
		fill_in(DAY, :with => day)
	end

	def fill_in_month(month)
		fill_in(MONTH, :with => month)
	end

	def fill_in_year(year)
		fill_in(YEAR, :with => year)
	end

end