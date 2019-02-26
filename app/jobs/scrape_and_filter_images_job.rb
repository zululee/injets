class ScrapeAndFilterImagesJob < ApplicationJob

  iam_policy("rekognition") #needed to use FilteredImageSet
  def run
    desired_image_subject = event['desired_image_subject']
    image_page_url = event['image_page_url']
    slack_response_url = event['slack_response_url']
    desired_images = FilteredImageSet.new(subject_filter: desired_image_subject)
    download_images(from: image_page_url, into: desired_images)
    post_images_to_slack(from: desired_images, to: slack_response_url)
  end

  private

  def download_images(from:, into:, limit: 25)
    image_page_url, desired_images = from, into
    image_urls = image_urls_from(image_page_url)
    hydra = Typhoeus::Hydra.new
    image_url[0...limit].each do |url|
      Typhoeus::Request.new(url).tap do |request|
        request.on_complete do |response|
          desired_images << OpenStruct.new({url: url, bytes: response.body})
        end
        hydra.queue(request)
      end
    end
    hydra.run
  end

end