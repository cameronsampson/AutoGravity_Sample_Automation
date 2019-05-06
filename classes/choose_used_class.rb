#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require "watir"

# randomly choose a used or new car for application
class ChooseUsed < BrowserRunner
 	def choose_make_model_year_type
 		if car_menu_a.present?
	 		car_menu_a.wait_until_present
	 		car_count = @browser.elements(:class => "listItem___2sP2S").length # get the amount of selections available (integer) 		
 		else
 			car_menu_b.wait_until_present
 			car_count = @browser.elements(:class => "item___2KSDy").length # get the amount of selections available (integer) 		
 		end
 		
 		$car_rand = rand(car_count) # max number of cars available to choose from
 		
 		select_car_type.click
 		sleep 2
 	end
 	
 	def verify_inventory
 		sleep 3
 		@browser.div(:class => "InventoryView___1Xsxd").present?
 	end
 	
 	def verify_loan_details
 		sleep 3
 		@browser.h1(:class => "contentTitle___S_Ugq").present?
 	end
 	
 	 def browse_inventory
 		@browser.article(:class => "inventoryListCard___1My3t").wait_until_present
 		inv_count = @browser.elements(:class => "inventoryListCard___1My3t").length  # get the amount of selections available (integer) 	
 		
 		$inv_rand = rand(inv_count) #max inventory to choose from
 		select_inventory.click
 		select_first_next.click
 		sleep 3
 		select_second_next.click
 		sleep 3
 	end
 	
 	private
 	
 	def select_car_type
 		if car_menu_a.exists?
 			@browser.div(:class => "listItem___2sP2S", :index => $car_rand)
 		else
 			@browser.div(:class => "item___2KSDy", :index => $car_rand)
 		end
 	end
 	
 	def car_menu_a
 		@browser.div(:class => "listItem___2sP2S")
 	end
 	
 	def car_menu_b
 		@browser.div(:class => "item___2KSDy")
 	end
 	
 	def select_inventory
 		@browser.article(:class => "inventoryListCard___1My3t", :index => $inv_rand)
 	end
 	
 	def select_first_next
 		@browser.button(:class => "buttonNext___2w_Xa")
 	end
 	
 	def select_second_next
 		@browser.button(:class => "btnSizeLg___314L_")
 	end
 	
 end