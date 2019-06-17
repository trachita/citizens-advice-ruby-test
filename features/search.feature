Feature: Search google for Citizens Advice and verifying the search functionality on the
  Citizens Advice website.

  Scenario Outline: Search Citizens Advice on  google and verify the search functionality
    Given  I launch google
    And   I enter citizens advice in google search
    When  I click on citizen advice website link
    And   I select England as state
    Then  I see <list_of_items> in the main navigation header
    When  I search for pension
    Then  I see a link of <state_pension>
    Examples:
      | list_of_items                                                                                       | state_pension|
      | Benefits,Work,Debt and money,Consumer,Housing,Family,Law and courts,Immigration,Health,More from us | State Pension|




