#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require "watir"

# This is the class that handles any data inputs throughout the
# automation process
class InputData < BrowserRunner
	# enter location for car shopping from homepage
	def enter_zip(zipcode)
		enterzip_field.set zipcode
		
	 	find_button.click
	 	sleep 3
	end
	
	# enter loan details for credit application
	def enter_loan_details(price,odometer,downpay)
		enterprice_field.set price
		enterodo_field.set odometer
		enterdown_field.clear # clear placeholder
		enterdown_field.set downpay
	end
	
	private
	
	def enterzip_field
		@browser.text_field(:placeholder => "Enter City or Zip")
	end
	
	def find_button
		@browser.div(:class => "align-self-start").button
	end
	
	def enterprice_field
		@browser.text_field(:id => "usedVehiclePriceinput")	
	end
	
	def enterodo_field
		@browser.text_field(:id => "odometerReadinginput")
	end
	
	def enterdown_field
		@browser.text_field(:id => "downpaymentinput")
	end

end