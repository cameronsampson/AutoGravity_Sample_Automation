#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require "watir"

# Letting driver/browser be initialized for any page object 
class ShopCar < BrowserRunner
	def used_car
      	@used_car = UsedCar.new(@browser)
    end
    
    def input_data
    	@input_data = InputData.new(@browser)
    end
    
    def choose_used
    	@choose_used = ChooseUsed.new(@browser)
    end
    
    def site_verification
    	@site_verification = SiteVerification.new(@browser)
    end

    def close
      	@browser.close
    end
end