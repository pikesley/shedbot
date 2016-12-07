desc 'take screenshots'
task :screenshots do
  FileUtils.rm_r '_screenshots'
  FileUtils.mkdir_p '_screenshots'
  pid = Process.spawn "selenium-server -log /tmp/selenium.log &"
  sleep 3
  sh "CLICKS=#{count_clicks} nightwatch --config _nightwatch/nightwatch.js"
  sh "pkill -f selenium"
  sh "open _screenshots"
end

def count_clicks
  clicks = 0
  f = File.readlines 'presentation/index.html'
  clicks += f.select { |l| l.match /<section/ }.count
  clicks += f.select { |l| l.match /fragment/ }.count
  clicks
end
