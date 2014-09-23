require 'calabash-android/calabash_steps'

Given(/^I am on the Main Screen $/) do
	    wait_for(180) {
	    	element_exists("button id:'mainButton'")
	    }
end

Then(/^I touch "(.*?)"$/) do |arg1|
end