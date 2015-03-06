# Gem Detector

#### Overview

Gem Detector is a ruby web app built with the Sinatra framework. Users can paste the contents of a ruby 
gemfile or the root url of a github repo and Gem Detector will retrieve information about each gem to be
displayed on the following results page. In addition to the summary and name of the gem, the results page
also lists the number of downloads and a link to the gem's home page. 

#### Background

Upon starting my first developer job as a ruby developer, I wanted to become familiar with the existing 
ruby and rails applications at my company. I read that one of the steps I should take when looking at a new
ruby project was to look at the gemfile. After looking up multiple gems on rubygems.org, I realized that I
could use something like gem detector to look everything up at once, and that perhaps, it would be useful 
to other new ruby developers. 

#### Lessons Learned

This was my first personal hobby project not connected to school and I wanted to use it as a learning opportunity.
Some of the things I learned while working on this project were:
* Threading 
 - I found that doing the API calls to get information about each gem resulted in wait times of 30 seconds or more.
 I wrapped my existing api call code block with the creation of new threads, pushed them into an array, and joined
 all the threads by iterating through the array and calling .join at the end. This reduced my api processing time from 
 30 seconds to 1 - 2 seconds. 
* Others
  - I also practiced with adding different styles, setting a css class variable depending on the content of the gem title. 
  - I created a helper method to take the number of downloads and convert it to a string with commas in the appropriate
  places.
  - Finally I just generally wanted to practice with structuring out the app and removing the logic from the app.rb 
  and views. 

#### Future Plans
* Right now I am only looking up information about the gem on rubygems.org. I would like to add the ability to parse inline
references to github for specific gems to look up the gem information there. 
* Create a gem that allows someone to lookup gem information in the console using a lookup method. 
 - Possibly have a command line menu that would let someone list out all of the gems on their system, arrow down to the gem
 they want to, hit enter, and read the information about the gem and its dependencies. 
