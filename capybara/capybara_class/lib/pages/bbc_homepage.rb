require 'capybara/dsl'

class BbcHomepage
	include Capybara::DSL

	HOMEPAGE_URL = 'https://www.bbc.co.uk/'
	SIGN_IN_LINK_ID = '#idcta-link'

	def visit_home_page
		visit(HOMEPAGE_URL)
	end

	def sign_in_link
		find(SIGN_IN_LINK_ID)
	end

	def click_sign_in_link
		find(SIGN_IN_LINK_ID).click
	end

end

# test1 = BbcHomepage.new
# test1.visit_home_page
# test1.sign_in_link
# test1.click_sign_in_link
