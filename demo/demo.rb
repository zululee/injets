# Agenda
# Introduce you to Jets
# Want to show you how CloudFormation can be used as an assembly language for other tools.

# Code used throughout — you may come across, and more often in the future, instances where an org uses a language for 
# Entirely code driven process

# what was ruby on rails?

# Environment specific config

app/controllers/demo_controller.rb
class DemoController < ApplicationController

  def hello
    render json: {
      response_type: 'ephemeral',
      text: "Hello!"
    }
  end

end

{
  "token": "8J6PzN5k54d2ibXuObK7sjBv",
  "team_id": "TGJQ0EREX",
  "team_domain": "radionuclide",
  "channel_id": "CGJSARVPW",
  "channel_name": "injets",
  "user_id": "UGL07EM1D",
  "user_name": "lukezakka",
  "command": "/scrape",
  "text": "https://en.wikipedia.org/wiki/Tree tree",
  "response_url": "https://hooks.slack.com/commands/TGJQ0EREX/562857411411/GXZFaLJclsNbEOK4XiQ8Rp12",
  "trigger_id": "563304614725.562816501507.f91693e1851f65934f857875db94a930"
}

#open cloudwatch monitoring
/scrape https://www.pexels.com/search/beach tree
#picture from silicon valley
/scrape https://www.pexels.com/search/hotdog hot dog
/scrape https://www.pexels.com/search/burger burger