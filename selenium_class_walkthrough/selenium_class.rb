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
		sleep 2
	end

	def get_first_name_text
		puts @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME)['value']
	end

	def input_lastname_field(text)
		@chrome_driver.find_element(:name, LAST_NAME_FIELD_NAME).send_keys(text)
		sleep 2
	end

	def choose_sex(text)
		if text == 'female'
			id = 'sex-1'
		elsif text == 'male'
			id = 'sex-0'
		end	
		@chrome_driver.find_element(:id, id).click
		sleep 2
	end

	def choose_years_of_expeerience(years_minus_one)
		@chrome_driver.find_element(:id, "exp-#{years_minus_one}").click
		sleep 2
		
	end

	def input_date(date)
		@chrome_driver.find_element(:id, 'datepicker').send_keys(date)
		sleep 2
	end

	def choose_profession(profession)
		if profession == 'Manual Tester'
			id = 'profession-0'
		elsif profession == 'Automation Tester'
			id = 'profession-1'
		end
		@chrome_driver.find_element(:id, id).click
		sleep 2
	end

	def upload_picture(link)
		element = @chrome_driver.find_element(:css, 'input[type=file]')
		element.send_keys("#{link}").click
		sleep 2
	end

	def choose_automation_tool(tool)
		# tool_options = @chrome_driver.find_elements(:name, 'tool')
		# tool_options.each { |tool_option| tool_option.click if tool_option.text == "#{tool}"}

		if tool == 'QTP'
			tool_id = 'tool-0'
		elsif tool == 'Selenium IDE'
			tool_id = 'tool-1'
		elsif tool == 'Selenium Webdriver'
			tool_id = 'tool-2'
		end
		@chrome_driver.find_element(:id, tool_id).click
		sleep 2
	end

	def choose_continent(continent)
		dropdown_list = @chrome_driver.find_element(:id, 'continents')
		options = dropdown_list.find_elements(:tag_name, 'option')
		options.each { |option| option.click if option.text == "#{continent}"}

		# options = @chrome_driver.find_element(:id, 'continents').find_element(:tag_name => 'option')

		# # continent_select = @chrome_driver.find_element(:id, 'continents')
		# # options = continent_select.find_element(:tag_name => 'option')
		# options[2].click
		#@chrome_driver.find_element(:id, "continents").find_element(:tag_name,"option.last").click
		sleep 2
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


