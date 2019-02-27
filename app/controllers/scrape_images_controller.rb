class ScrapeImagesController < ApplicationController

  iam_policy("lambda") # needed to call background job lambda
  def scrape
    slack_response_url = params[:response_url]
    image_page_url, desired_image_subject = parse_args(params[:text])
    ScrapeAndFilterImagesJob.perform_later(:run, {
      desired_image_subject: desired_image_subject,
      image_page_url: image_page_url,
      slack_response_url: slack_response_url
    })
    render json: { # immediate response to slack
      response_type: 'ephemeral',
      text: "Scraping #{desired_image_subject.singularize} images from #{image_page_url}. Please wait...:hourglass_flowing_sand:"
    }
  end

  private

  def parse_args(args_str)
    tokens = args_str.split(' ').map(&:strip) # remove extra spaces
    [tokens[0], tokens[1..-1].join(' ')]
  end

end