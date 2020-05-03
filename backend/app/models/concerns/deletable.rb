module Deletable
  extend ActiveSupport::Concern

  included do
    scope(:available, ->() {
      where(is_available: true)
    })

    def available?
      !!self.is_available
    end

    def delete!
      self.update!(deleted_at: Time.zone.now) if self.deleted_at.nil?
    end
  end
end
