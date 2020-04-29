module Deletable
  extend ActiveSupport::Concern

  included do
    scope(:available, ->() { self.where(is_available: true) })

    def delete!
      self.update!(deleted_at: Time.zone.now) if self.deleted_at.nil?
    end
  end
end
