class ScrapeImagesController < ApplicationController
  def scrape
    render json: {
      respond_type: 'ephemeral',
      text: "you've sent a command"
    }
  end
end
