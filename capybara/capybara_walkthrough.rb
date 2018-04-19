require 'capybara'

#register chrome driver with capybara

Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

#create new session
session = Capybara::Session.new(:chrome)

# cheat sheet: https://gist.github.com/zhengjia/428105

#use the visit method to navigate to page
session.visit('http://toolsqa.com/automation-practice-form/')

#Simple form entries
session.fill_in('firstname', :with => 'test')
session.fill_in('lastname', :with => 'tofalvi')

#radio buttons
session.choose('sex-1')
session.choose('exp-6')

#date picker
session.fill_in('datepicker', :with => '01/01/1988')

#check box
session.check('profession-1')
session.check('tool-2')

#upload picture
session.attach_file('photo', '/Users/tech-a63/Desktop/orca.jpeg')

#click on link
session.click_link('Test File to Download')

#dropdown
session.select('Europe', :from => 'continents')
session.select('Switch Commands', :from => 'selenium_commands')

#submit
session.click_button('submit')

# session.find(:css, '#NextedText')
# session.find_button('Button')
# session.find_link('Partial Link Test').text



