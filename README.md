# What

It's a bot!

First cut of a little something something based on Barrett Clark's post: [http://cookingco.de/2015/01/31/twitter-bot-on-heroku/]()

I'm evolving it a little. Not sure for how long. Don't trust this project!

# How

1. Grab the repo
2. Create a twitter app (Perhaps from a freshly made account just for your bot?)
2. Update the .env with your own vars
2. Create a Heroku app
3. Set your environment vars on Heroku
3. Push to Heroku
4. $ `heroku ps:scale worker=1`
