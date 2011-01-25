# Getting Started #
## Dependencies ##
Once in the directory, run
    bundle install
This command installs all the dependencies needed for the application.

*note: If you get an error on linecache19, try installing it seperately (gem install linecache19) -- if that fails, google the crap out of it. you probably need some dependencies*

## Building database ##

    rake db:migrate
 Make sure schema is updated (all migrations are done), and then execute rake db:seed to seed the database with spring 2011 course data

    rake db:seed

 Alternately, you can just run rake db:setup to setup the entire database (and make sure migrated to latest version of schema)

    rake db:setup

## Server ##
We're using the thin server because we get a URI too large error with the default Webrick server
### Installing ###
    sudo gem install thin

### Running ###
    rails server thin
or
    screen rails server thin
	(ctrl+a, d) to get out of the screen. (screen -r to resume)
