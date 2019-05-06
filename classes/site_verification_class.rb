#!/usr/bin/env ruby
# encoding: utf-8

gem "rspec"
require "rspec"
require "rubygems"
require "watir"
require "spec_helper"

# Verification/Assertion via RSpec Examples (Hero Video, Personal Information Page)
class SiteVerification < BrowserRunner
	include RSpec::Matchers
	
	# Hero Video Homepage
	def verify_hero
		@browser.video(:src => "https://static.autogravity.com/web/pages/home/hero-v2-video.mp4").present?
	end
	
	# Personal Information (Final) Page
	def verify_persinfo
		@browser.url == "https://www.autogravity.com/credit/application/personal"
		@browser.div(:visible_text, /Personal Information$/).present?
	end
	
end