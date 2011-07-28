Feature: Rent a Movie
  In order to rent a movie to a customer
  As the rental store owner
  I should be able to rent out a movie

  Scenario: Rent a movie to customer
    Given there is a customer named "Tom"
    And there is a movie named "Kungfu Panda" available in the store
    And there is a movie named "Cars" available in the store
    When I go to the Movie Rental page
    And I rent out the movie "Cars" to "Tom"
    Then the movie "Cars" should be rented out
    And I should see the message "Cars has been rented to Tom"

  Scenario: Rent a movie already rented out
    Given there is a customer named "Tom"
    And there is a movie named "Kungfu Panda" available in the store
    And there is a movie named "Cars" already rented out
    When I go to the Movie Rental page
    And I rent out the movie "Cars" to "Tom"
    Then the movie "Cars" should not be rented out
    And I should see the message "Sorry! That movie could not be rented out"
        
    
