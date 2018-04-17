require 'selenium-webdriver'


#page object module
class SeleniumQaToolsForm
	PRACTICE_FORM_URL = 'http://toolsqa.com/automation-practice-form/' #constant variable
	FIRST_NAME_FIELD_NAME = 'firstname'
	LAST_NAME_FIELD_NAME = 'lastname'

	def initialize
		@chrome_driver = Selenium::WebDriver.for :chrome
		#wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	end

	def visit_practice_form
		@chrome_driver.get(PRACTICE_FORM_URL)
	end

	def input_firstname_field(text)
		@chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME).send_keys(text)
	end

	def get_first_name_text
		puts @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME)['value']
	end

	def input_lastname_field(text)
		@chrome_driver.find_element(:name, LAST_NAME_FIELD_NAME).send_keys(text)
	end

	def choose_sex(text)
		if text == 'female'
			id = 'sex-1'
		elsif text == 'male'
			id = 'sex-0'
		end	
		@chrome_driver.find_element(:id, id).click
	end

	def choose_years_of_expeerience(years_minus_one)
		@chrome_driver.find_element(:id, "exp-#{years_minus_one}").click
		
	end

	def input_date(date)
		@chrome_driver.find_element(:id, 'datepicker').send_keys(date)
	end

	def choose_profession(profession)
		if profession == 'Manual Tester'
			id = 'profession-0'
		elsif profession == 'Automation Tester'
			id = 'profession-1'
		end
		@chrome_driver.find_element(:id, id).click
	end

	def upload_picture(link)
		element = @chrome_driver.find_element(:css, 'input[type=file]')
		element.send_keys("#{link}").click
	end

	def choose_automation_tool(tool)
		if tool == 'QTP'
			id = 'tool-0'
		elsif tool == 'Selenium IDE'
			id = 'tool-1'
		elsif tool == 'Selenium Webdriver'
			id = 'tool-2'
		end
		@chrome_driver.find_element(:id, id).click
	end

	def choose_continent(value)
		@chrome_driver.find_element(:id, "continents").find_element(:css,"option=#{value}").click
		sleep 10
	end

	def submit
		@chrome_driver.find_element(:id, 'submit').click
	end
	
end

form = SeleniumQaToolsForm.new
form.visit_practice_form
form.input_firstname_field('Melinda')
form.get_first_name_text
form.input_lastname_field('Tofalvi')
form.choose_sex('female')
form.choose_years_of_expeerience(6)
form.input_date('2018-04-17')
form.choose_profession('Automation Tester')
#form.upload_picture("Desktop/orca.jpg")
form.choose_automation_tool('Selenium Webdriver')
form.choose_continent('Europe')
form.submit


