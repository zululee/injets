class FilteredImageSet < Set

  attr_reader :subject_filter

  def initialize(collection=[], subject_filter: 'cat')
    @subject_filter = subject_filter
    @rekognition = Aws::Rekognition::Client.new
    super(collection)
  end

  def <<(image)
    begin
      super if subject_detected_in?(image)
    rescue
      # notify error tracker
    end
    image
  end

  private

  def subject_detected_in?(image)
    response = @rekognition.detect_labels({
      image: {
        bytes: image.bytes
      }
    })
    labels = response.labels.map{|label| label.name.downcase}
    matches = [@subject_filter, @subject_filter.singularize] & labels
    matches.present?
  end

end