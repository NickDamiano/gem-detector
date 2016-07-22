# Gem Detector

#### Overview

Gem Detector is a ruby web app built with the Sinatra framework. Users can paste the contents of a ruby 
gemfile or the root url of a github repo and Gem Detector will retrieve information about each gem to be
displayed on the following results page. In addition to the summary and name of the gem, the results page
also lists the number of downloads and a link to the gem's home page. 

#### Background

Upon starting my first developer job as a ruby developer, I wanted to become familiar with the existing 
ruby and rails applications at my company. I read that one of the steps I should take when looking at a new
ruby project was to look at the gemfile. We had multiple main apps and several smaller apps so it was tedious
to look through all the gemfiles, one gem at a time. I created gem detector as my first post-school hobby project - 
hoping it would be useful to other new ruby developers. 

#### Lessons Learned

This was my first personal hobby project not connected to school and I wanted to use it as a learning opportunity.
Some of the things I learned while working on this project were:
* Threading 
 - I found that doing the API calls to get information about each gem resulted in wait times of 30 seconds or more.
 I wrapped my existing api call code block with the creation of new threads, pushed them into an array, and joined
 all the threads by iterating through the array and calling .join at the end. This reduced my api processing time from 
 30 seconds to 1 - 2 seconds. A year later, rubygems.org set stricter limits on api calls which broke the app. I separated
 the api call into a method I could loop through until it received a good response. This extended out the length of time to 
 5 - 8 seconds. 
* Others
  - I also practiced with adding different styles, setting a css class variable depending on the content of the gem title. 
  - I created a helper method to take the number of downloads and convert it to a string with commas in the appropriate
  places. It's a simple thing but it was something this project 
  - Finally I just generally wanted to practice with structuring out the app and removing the logic from the app.rb 
  and views. 

#### Future Plans
* Since the API request limits were enacted and the app is a bit slower as a result, I want to create an accurate
loading bar when the submit button is clicked. 
* Recursively search the gemfiles of dependencies to see all and see when they were last updated. I noticed occasionally 
errors and failed tests at my first dev job that were due to gemfile dependency gems updating versions where we or others
 had not properly locked them down. 