require "capybara"
require "capybara/cucumber"
require "site_prism"
require "rspec"
require "rufo"
require "selenium-webdriver"
require "allure-cucumber"
require "webdrivers"
require_relative "../pages/restaurants_page.rb"

World(Actions)

Capybara.register_driver :chorme do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    "goog:chromeOptions" => {
      "args" => ["--headless", "--disable-site-isolation-trials", "--disable-gpu"],
      "excludeSwitches" => ["enable-logging"],
    },
  )
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :capabilities => caps)
end

Capybara.configure do
  include RSpec::Matchers
  Capybara.run_server = false
  Capybara.default_driver = :chorme
  Capybara.default_max_wait_time = 10
  Capybara.app_host = "https://enjoeat-sp2.herokuapp.com"
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end
