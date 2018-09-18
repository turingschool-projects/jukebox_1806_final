# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
As a Visitor (not logged in)
User Story 1:

As a Visitor,
  When I visit a song show page,
    I see the numeric rating for this song

Testing requirements:
- rating should be an integer attribute (from 1 to 5)
User Story 2:

As a Visitor,
  When I visit the genre index page,
    I see all genres in the database.

Testing requirements:
- users should see at least 2 genres listed on the page
Admin User Stories
User Story 3:

As an admin user, 
  When I visit the same genre index page that visitors see,
  I see the same information visitors see,
    And I also see a form to create a new genre.
  
Testing requirements:
- users should see at least 2 genres listed on the page

Note: admins will not have a separate page for the form, the form should be on the index page
User Story 4:

As an admin user, 
  When I visit the same genre index page that visitors see,
    And I fill out the form with a new genre's name and submit that form, 
  I return to the genre index page that visitors see,
    And I see all previous genres and the new genre I have just created.

Testing requirements:
- I should see at least 2 previous genres listed plus the new genre
As a Visitor (not logged in)
User Story 5:

As a Visitor,
  When I visit the genre index page,
    I cannot see the form to create new genres, 
      And I do not have access to any routes that could create a genre.
    And each genre's name should be a link to that genre's show page.

Testing requirements:
- I should see at least 2 genres listed
- All users of the web site see the genres' names as links
User Story 6:

As a Visitor,
  When I visit a genre show page,
    I see all songs associated with that genre listed on the page.

Testing requirements:
- I should see at least 2 songs listed for a genre
- Also include 1 or more songs that are NOT associated with this genre and ensure
  they do not appear on the page
User Story 7:

As a Visitor,
  When I visit a song show page,
    I see genre names under a heading that says "Genres for this Song:"
      and the genres listed are only the genres associated with this song.

Testing requirements:
- I should see at least 2 genres listed for a song
- Also include 1 or more genres that are NOT associated with this song and ensure
  they do not appear on the page
User Story 8:

As a Visitor,
  When I visit a genre show page,
    I see the average rating for all songs in this genre

Testing requirements:
- I should add at least 2 songs for this genre
- Also include 1 or more songs NOT associated with this genre to ensure these
  other songs are not included in the average rating
Extensions
If you have finished ALL previous stories fully but your assessment time is not yet over, please continue on these extra stories; there are no extra points for completing these, it's to avoid disruption in the classroom while others are still working. Please try to minimize other noise.

As a Visitor,
  When I visit a genre show page,
    I see the name and rating of the song with the highest rating of all songs 
    in this genre
As a Visitor,
  When I visit a genre show page,
    I see the name and rating of the song with the lowest rating of all songs 
    in this genre
As a Visitor,
  When I visit a song show page,
    I see up to three other songs that have the same rating.
