1806 Final Coding Assessment Retake
Please take a few minutes to COMPLETELY read this entire document (especially the user stories and the rubric) before beginning any work.

Setup
Visit https://github.com/turingschool-projects/jukebox_1806_final
Fork the repo to your own GitHub account
In an entirely new folder on your laptop, clone your forked repo and make a local branch using the following instructions:
git clone https://github.com/YOUR-GITHUB-USERNAME/jukebox_1806_final
cd music_box_1804_final
git checkout -b YOUR-NAME-1804-final
(replace YOUR-NAME and YOUR-GITHUB-USERNAME with your actual information)

Make sure you bundle, reset your database, and ensure RSpec is working:
bundle install
bundle update
rake db:{drop,create,migrate,seed}
rspec
All tests should pass and you should see 100% test coverage. If you have ANY problems running the steps above, please seek an instructor immediately!

DO NOT DO THE FOLLOWING:
Do NOT continue working on the final if the above steps do not run completely error-free, see an instructor ASAP
Do NOT complete this work on any other pre-existing Jukebox code base, you MUST use a fresh forked copy using the URL above!
Saving/Submitting Your Work
Commit your work EVERY 15 MINUTES.
When you are finished, or the evaluation time has ended, commit all final changes and push your branch to your forked repository on GitHub.
Create a Pull Request to Turing's repo
Put your name in the Pull Request title, like "Ian Douglas 1806 Final"
In the Pull Request comment, please indicate which User Story you have fully completed -- not where you left off, which story is the last one you fully finished?
User Stories
We are going to add Awards to our music application.

An award only has a name, and you will need to track when a song was given that award by adding a year attribute to the join table you're going to create.

Visitor (unregistered user, not logged in)
## User Story #1

As a Visitor,
  When I visit the awards index,
    I see all awards
      and each award should be a link to that award's show page.

Testing requirements:
- users should see at least 2 awards listed on the page
Admin User
## User Story #2

As an admin user,
  When I visit the same awards index page that visitors see,
    I can see a form to create a new award

Testing requirements:
- users should see at least 2 awards listed on the page, plus the form
## User Story #3

As an admin user,
  When I visit that same awards index page,
  When I fill out the form with the award's title,
    And click 'Create Award',
    I see a list of all awards including the one I have just created.

Testing requirements:
- users should see at least 2 awards listed on the page, plus the new one created
Visitor (unregistered user, not logged in)
## User Story #4
As a Visitor,
  When I visit the awards index,
    I cannot see the form to create new awards.
User Story #5
As a Visitor,
  When I visit the song index,
    Under each song title listed,
    I also see a heading that says "Awards for this Song:"
    I also see each award the song have won
    I also see what year the award was won

Testing requirements:
- users should see at least 2 songs on the page
- each song should have at least 2 awards
## User Story #6

As a Visitor,
  When I visit the awards index,
    And I click on an award name,
    I see a page with the awards's title.
## User Story #7

As a Visitor,
  When I visit the awards index,
    And I click on an award name,
    I see all songs which received this award
    I also see the year each song received its award.

Testing requirements:
- users should see at least 2 songs win this award
Rubric
To pass the final, you must meet expectations on all of the items below. If you do mot meet expectations in any of these areas, your final is not considered "passing" and you need to speak with an instructor ASAP!

Code Quality
MEETS EXPECTATIONS: All controllers, models and views are refactored to accommodate new user stories. Logic lives in appropriate places per MVC lessons.
BELOW EXPECTATIONS: Controllers, models, or views do not have a clear separation of MVC responsibilities.
ActiveRecord
MEETS EXPECTATIONS: Methods are built using ActiveRecord. No Ruby is used where ActiveRecord can handle the task.
BELOW EXPECTATIONS: One or more areas where Ruby is used where ActiveRecord should have been used.
Testing
MEETS EXPECTATIONS: Each feature has one or more tests associated with it. Any model methods written are fully covered with model tests.
BELOW EXPECTATIONS: Feature tests or model tests are incomplete, missing, or testing is done in the the wrong place (ie, model methods are tested in feature tests, or vice versa)
Functionality
MEETS EXPECTATIONS: Completes at least 5 of the 7 User Stories
BELOW EXPECTATIONS: Did not complete at least 5 User Stories.
