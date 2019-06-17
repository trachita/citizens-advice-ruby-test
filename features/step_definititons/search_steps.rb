require 'selenium-webdriver'

#Selenium::WebDriver::Chrome.driver_path = "C:/Users/ranje/RubymineProjects/citizens-advice-test/features/executables/chromedriver.exe"
driver = Selenium::WebDriver.for :chrome


Given("I launch google") do
  driver.navigate.to "http://www.google.com"
  driver.manage.window.maximize
end

When("I enter citizens advice in google search") do
  GOOGLE_SEARCH= driver.find_element(:name, 'q')
  GOOGLE_SEARCH.send_keys("citizens advice")
  GOOGLE_SEARCH.submit
end

When("I click on citizen advice website link") do
  driver.find_element(:xpath=> "//a[@href='https://www.citizensadvice.org.uk/']").click
end

And("I select England as state") do
  driver.find_element(:xpath => "//a[@href='?lang=en-GB']").click
end

Then(/^I see (.*) in the main navigation header$/) do |list_of_items|
  MENU_ITEM = driver.find_elements(:xpath => "//*[@class='top-item js-mega-menu']")
  i=0
  actual_menu=Array.new(0)
  while i < MENU_ITEM.length
    item = MENU_ITEM[i].text
    i += 1
    actual_menu.insert(0,item)
  end
  expected_list_of_menu_items = list_of_items.split(",")
  expect(actual_menu).to match_array(expected_list_of_menu_items)
end

When("I search for pension") do
  SEARCH = driver.find_element(:xpath => "//div[@class='search-inline__field']/input[@name='q']")
  SEARCH.send_keys("Pension")
  SEARCH.submit
end

Then(/^I see a link of (.*)$/) do |state_pension|
  STATE_PENSION_TEXT= driver.find_element(:link_text , 'State Pension').text
  expect(STATE_PENSION_TEXT).equal?(state_pension)
end
