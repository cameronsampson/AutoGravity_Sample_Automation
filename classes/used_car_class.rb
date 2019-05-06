#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require "watir"

class UsedCar < BrowserRunner
	URL = "http://www.autogravity.com"

    def open
      	@browser.goto URL
      	self
    end
    
    def shop_used
    	@browser.span(:visible_text => /Shop Used$/).click
    end
    
end