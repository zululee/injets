class DemoController < ApplicationController

  def hello
    render json: {
      response_type: 'ephemeral',
      text: "hello"
    }
  end

end

Jets.application.routes.draw do
  root "jets/public#show"

  # The jets/public#show controller can serve static utf8 content out of the public folder.
  # Note, as part of the deploy process Jets uploads files in the public folder to s3
  # and serves them out of s3 directly. S3 is well suited to serve static assets.
  # More info here: http://rubyonjets.com/docs/assets-serving/
  
  post "demo", to: "demo#hello"

  any "*catchall", to: "jets/public#show"  
end
