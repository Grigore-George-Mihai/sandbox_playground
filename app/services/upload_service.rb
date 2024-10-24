# frozen_string_literal: true

class UploadService
  def initialize(model_class, model_params)
    @model_class = model_class
    @model_params = model_params
  end

  def call
    model_instance = @model_class.new(@model_params)
    return unless model_instance.save

    model_instance
  end
end
