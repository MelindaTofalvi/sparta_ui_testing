require 'capybara/dsl'

class BbcRegisterOk
	include Capybara::DSL 

	SUCCESS = 'Email sent. Now check your inbox and follow the instructions'

	def successful_reg_message
		within(:css, 'div.page__content') do
			find('p').text
		end
	end


end