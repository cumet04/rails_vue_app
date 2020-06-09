class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  alias_method :model_as_json, :as_json

  # guard for directly rendering ApplicationRecord instance by mistake
  def as_json(*)
    raise InvalidRenderError.new(self)
  end
end
