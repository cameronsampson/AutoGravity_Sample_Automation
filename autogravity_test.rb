#!/usr/bin/env ruby
# encoding: utf-8

gem "rspec"
require "rspec"
require "rubygems"
require "watir"
require "spec_helper"
require_relative "classes/browser_runner_class.rb"
require_relative "classes/shop_car_class.rb"
require_relative "classes/used_car_class.rb"
require_relative "classes/input_data_class.rb"
require_relative "classes/choose_used_class.rb"
require_relative "classes/site_verification_class.rb"

 
 # Test Behavior
shopcar = ShopCar.new(Watir::Browser.new) # define browser initialization
used_car = shopcar.used_car.open # launch site

# Verify Hero Video from Homepage
describe "Autogravity homepage" do
	it "should include autogravity hero" do
		shopcar.site_verification.verify_hero
	end
end 

# Start application from Used Car button
shopcar.used_car.shop_used

shopcar.input_data.enter_zip "92127"

# Run through car selection until reaching inventory or loan details page
until shopcar.choose_used.verify_inventory || shopcar.choose_used.verify_loan_details
	shopcar.choose_used.choose_make_model_year_type
end

if shopcar.choose_used.verify_inventory
	shopcar.choose_used.browse_inventory # select a car from inventory
else
	shopcar.input_data.enter_loan_details "100000","40000","15000" # data for loan details form
end
	
# Check completion of automation by verifying personal information
describe "Automation completion" do
	it "should verify present page is personal information" do
		shopcar.site_verification.verify_persinfo
	end
end 

puts "Automation Complete!"




