# frozen_string_literal: true

# Application Presenter
class ApplicationPresenter < SimpleDelegator
  def initialize(model, template)
    @model = model
    @template = template
    super(@model)
  end
end
