require 'capybara'
require 'capybara/dsl'
require 'rspec/core'
require 'capybara/rspec/matchers'
require 'capybara/rspec/features'
# require 'capybara/poltergeist'
# require 'capybara/webkit'
require "selenium-webdriver"
# require "sauce/capybara"
                                  
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :js_errors => false)        
end

Capybara.register_driver :webkit do |app|
  Capybara::Poltergeist::Driver.new(app, :js_errors => false)        
end

Capybara.javascript_driver = :poltergeist
Capybara.javascript_driver = :webkit

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)          
end

Capybara.register_driver :safari do |app|
  Capybara::Selenium::Driver.new(app, :browser => :safari)           
end

Capybara.register_driver :internet_explorer do |app|
  Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)           
end 

Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
end

# ****** For souce Lab

# Capybara.register_driver :remote do |app|

#   @login = ENV["SAUCE_USERNAME"]
#   @access_key = ENV["SAUCE_ACCESS_KEY"]

#   if ENV['BROWSER'] == 'ie10' || ENV['BROWSER'] == 'ie11'
#     platform = 'Windows 7'
#     browser = 'internet explorer'
#   else
#     platform = 'OS X 10.10'
#     browser = ENV['BROWSER']
#   end

#   version = nil

#   if ENV['BROWSER'] == 'ie10'
#     version = 10
#   elsif ENV['BROWSER'] == 'ie11'
#     version = 11
#   end
    
#   caps = {:browserName => browser, :platform => platform, :version => version, :seleniumVersion => '2.45.0', :name => $b}
  
#   url = "http://"+@login+":"+@access_key+"@ondemand.saucelabs.com:80/wd/hub"   #Ar VMware with IE10 + Win 8#url = 'http://10.2.136.100:5555/wd/hub'
#   Capybara::Selenium::Driver.new(app, :browser => :remote, :url => url, :desired_capabilities => caps)            
# end

if ENV['DRIVER'] == 'poltergeist'
  Capybara.default_driver = :poltergeist

elsif ENV['DRIVER'] == 'webkit'                                         
  Capybara.default_driver = :webkit 

# elsif ENV['DRIVER'] == 'firefox'                                         
#   Capybara.default_driver = :selenium 
elsif ENV['DRIVER'] == 'firefox'                                         
  Capybara.default_driver = :selenium_firefox 

elsif ENV['DRIVER'] == 'chrome' 
  Capybara.default_driver = :chrome 

elsif ENV['DRIVER'] == 'safari'
  Capybara.default_driver = :safari

elsif ENV['DRIVER'] == 'internet_explorer'
  Capybara.default_driver = :internet_explorer
end

# elsif ENV["DRIVER"] == 'remote'
#   Capybara.default_driver = :remote
# end

unless ENV["DRIVER"] == "poltergeist"  || ENV["DRIVER"] == "webkit" || ENV["DRIVER"] == "firefox" || ENV["DRIVER"] == "chrome" || ENV["DRIVER"] == "safari" || ENV["DRIVER"] == "internet_explorer" || ENV["DRIVER"] == "remote"
  raise "You must add DRIVER=poltergeist or DRIVER=webkit or DRIVER=chrome or DRIVER=safari or DRIVER=firefox or DRIVER=internet_explorer to the beginning of your command or DRIVER=remote "
end

if ENV["DRIVER"] == "remote"
  unless ENV["BROWSER"] == "chrome"  || ENV["BROWSER"] == "firefox" || ENV["BROWSER"] == "safari" || ENV["BROWSER"] == "ie10" || ENV["BROWSER"] == "ie11"
    raise "You must add BROWSER=chrome or BROWSER=firefox or BROWSER=safari or BROWSER=ie10 or BROWSER=ie11 to your command"
  end
end

Capybara.ignore_hidden_elements = true 
Capybara.app_host = @url
Capybara.run_server = false

RSpec.configure do |config|
  config.include Capybara::DSL, :type => :request
  config.include Capybara::DSL, :type => :acceptance
  config.include Capybara::RSpecMatchers, :type => :request
  config.include Capybara::RSpecMatchers, :type => :acceptance
  
  config.after do
    Capybara.use_default_driver
  end 

  # config.before do    
  #   Capybara.current_driver = Capybara.javascript_driver if example.metadata[:js]
  #   Capybara.current_driver = example.metadata[:driver] if example.metadata[:driver]
  # end
end

Capybara.app_host = "https://www.javaranch.com/"

shared_context "login" do
  before :all do 
    visit "https://www.javaranch.com/"
    
  end
end 
