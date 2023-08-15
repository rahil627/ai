conclusion:
ruby minimal web frameworks (roda > sinatra)
  - **for minimalist apps**
  - for educational purposes: old school web app making in a minimalist style
**flutter**
  - for mobile apps + web apps together! > react native
  - for performance/graphics thanks to web assembly output
  - **for people that hate web dev (html/css/js)**
react vs rails
  - for big stuff


just some notes:
https://www.reddit.com/r/ruby/comments/ecg2q2/which_ruby_web_framework_to_use_these_days/
  - Why is it you want to use a framework? If you just need a way to interact via HTTP you might want to look into rack. Want routing as well? Might as well start out with roda. Need more features and ease of use? Check out sinatra. Want to learn about a battle-tested, full featured framework? Look into rails.

roda > sinatra
  - https://www.reddit.com/r/ruby/comments/x0iyg1/sinatra_vs_roda_whats_your_take/


hanami or rails



x/pure js
  - acutally looks good
  - rquires node.js for server-side execution
  - express.js is the js copy of sinatra
**ruby/sinatra/roda** (or python/flask)
  - the prettiest solution (app.rb)
  - even includes a choice of templating system (just as jekyll does): simplify writing html/js/css, and with your choice in style!
  - you'd still have to write html/js though :(
  - see this example: https://github.com/katleiahramos/Sinatra-Capsule-Wardrobe-App/tree/master
x/elixir
  - compact
  - strict MVC file structure
  - has an additional learning curve for functional programming

for bigger apps can throw in flutter or react

**flutter**
  - **NO HTML/CSS/JS!!!**
  - compile (transpile?) to web assembly
  - coming soon: interop with js
  - feels more systems programmingy (lots of ugly nesting), probably with better debugging too, and hot re-load for mobile
  - see excellent samples folder: https://github.com/flutter/samples
    - https://github.com/flutter/samples/tree/main/veggieseasons/lib

react actually has the most sensible output and also one file
  - what's the overhead? overkill?
  - react native has direct competition with flutter


ai is amazing for building skeletons/boiler-plate code, and just building enough so that you can jump into making, without copying/remembering various frameworks, languages, etc.
