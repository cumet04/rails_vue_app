# refs ApplicationRecord#as_json

class InvalidRenderError < StandardError
  attr_reader :target

  def initialize(target)
    @target = target
    super("ActiveModel direct render is detected, " +
          "#{target.class.name}, id=#{target.id}")
  end
end
