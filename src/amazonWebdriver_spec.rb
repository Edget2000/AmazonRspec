require 'rspec'
require 'selenium-webdriver'

describe 'Amazon Website' do

  before(:each)do
    @driver = Selenium::WebDriver.for :firefox
    @driver.get 'https://www.amazon.co.uk'

    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

    puts @driver.title
  end

  it 'should Open Amazon Homepage' do

    @wait.until {@driver.find_element(:id, 'nav-link-yourAccount').click}

    @wait.until {@driver.find_element(:id, 'ap_email').send_keys 'edget2000@yahoo.co.uk'}
    puts @driver.title

    @driver.find_element(:id, 'ap_password').send_keys 'D209576w'
    @driver.find_element(:id, 'signInSubmit').click

    @wait.until {@driver.find_element(:id, 'nav-your-amazon').click}
    puts @driver.title

    @wait.until {@driver.find_element(:link_text, "Today's Deals").click}
    puts @driver.title

    @wait.until {@element = @driver.find_element(:id, 'nav-link-yourAccount')}
    @driver.action.move_to(@element).perform

    @driver.find_element(:id, 'nav-item-signout').click
    puts @driver.title
  end

  after(:each)do
    @driver.close
    @driver.quit

  end
end