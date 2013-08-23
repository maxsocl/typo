Feature: Merge Articles
  As a blog administrator
  In order to avoid duplicate atricles
  I want to be able to merge a similar articles

  Background:
    Given the blog is set up
    And the following articles exist: 
    | title        | author | body   | commentText |
    | First Title  | max    | Hello  | comment1    |
    | Second Title | max    | World! | comment2    |
    And I am logged into the admin panel

  Scenario: Non-admin should not see the merge article link
    Given I am logged into the user panel
    And I am on the edit page for "First Title"
    Then I should not see "Merge Articles"

  Scenario: Successfully merge articles
    Given I am logged into the admin panel
    And I am on the edit page for "First Title"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the articles listing page
    And I should see "Articles Successfully Merged"
    And I should see "First Title"
    And I should not see "Second Title"


    When I go to article edit page for "First Title"
    When I should see "max"
    And I should see "Hello World!"

    When I go to article feedback page for "First Title"
    Then I should see "comment1"
    And I should see "comment2"
