require_relative 'pages/bbc_homepage'
require_relative 'pages/bbc_sign_in_page'
require_relative 'pages/bbc_register'
require_relative 'pages/bbc_register_ok'
require_relative 'pages/bbc_register_date_of_birth'
require_relative 'pages/bbc_registration_form'


#superclass
class BbcSite

	def bbc_homepage
		BbcHomepage.new
	end

	def bbc_sign_in_page
		BbcSignInPage.new
	end

	def bbc_register
		BbcRegister.new
	end

	def bbc_successfully_registered
		BbcRegisterOk.new
	end

	def bbc_register_date_of_birth
		BbcRegisterDateOfBirth.new
	end

	def bbc_registration_form
		BbcRegistrationForm.new
	end
end