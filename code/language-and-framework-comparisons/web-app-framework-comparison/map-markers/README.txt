just some notes:
https://www.reddit.com/r/ruby/comments/ecg2q2/which_ruby_web_framework_to_use_these_days/
  - Why is it you want to use a framework? If you just need a way to interact via HTTP you might want to look into rack. Want routing as well? Might as well start out with roda. Need more features and ease of use? Check out sinatra. Want to learn about a battle-tested, full featured framework? Look into rails.

roda > sinatra
  - https://www.reddit.com/r/ruby/comments/x0iyg1/sinatra_vs_roda_whats_your_take/


hanami or rails



pure js is just fine (server.js), i guess you'd install node.js for server-side execution
  - express.js is the js copy of sinatra
**ruby/sinatra** is just prettier (app.rb), and if you've got that installed server-side, can avoid node.js/npm/etc. ;)
  - seems like the prettiest solution, and it even includes a choice of templating system (just as jekyll does), to
simplify writing html/js/css, and with your choice in style! 
  - todo: compare to pure ruby
x/elixir is compact, with a strict MVC file structure, def a learning curve for functional programming

for bigger apps can throw in flutter or react
flutter feels more systems programmingy (lots of ugly nesting), probably with better debugging too, and hot re-load for mobile
react actually has the most sensible output and also one file
  - what's the overhead? overkill?
  - react native has direct competition with flutter


ai is amazing for building skeletons/boiler-plate code, and just building enough so that you can jump into making, without copying/remembering various frameworks, languages, etc.
