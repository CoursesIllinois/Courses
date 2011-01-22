# Getting Started #

## Stuff to install ##
Once in the directory, run
    bundle install
This command installs all the dependencies needed for the application.
*note: If you get an error on linecache19, try installing it seperately (gem install linecache19) -- if that fails, google the crap out of it. you probably need some dependencies*

## Building database ##
1. rake db:migrate
2. rake db:seed

* Make sure schema is updated (all migrations are done), and then execute rake db:seed to seed the database with spring 2011 course data
* Alternately, you can just run rake db:setup to setup the entire database (and make sure migrated to latest version of schema)

## Server ##
Using thin server because webbrick messes up with omniauth
    sudo gem install thin

## Running ##
    thin start
or
    screen thin start
	(ctrl+a, d) to get out of the screen. (screen -r to resume)
