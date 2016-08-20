# Commute Tracker

This is a web app that helps you track your everyday commute (how long it takes you, when you leave, when you arrive, what route you take, etc.). I'm planning on adding GPS tracking at some point to allow for some pretty graphs and maps. The end goal is to algorithmically determine what is the best time to leave for work and when to go home. 

As of 8/19/2016, the version deployed on Heroku is v0.1. The Heroku deployment will not be updated until the refactoring is complete. 

## Installing

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Credits

The framework of this web app was built with [Michael Hartl's](http://www.michaelhartl.com/) [*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://www.railstutorial.org/). 

## License

MIT License. 
