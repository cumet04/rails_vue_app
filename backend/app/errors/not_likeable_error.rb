class NotLikeableError < StandardError
  attr_reader :target

  def initialize(target, msg = nil)
    @target = target
    if target
      msg ||= "Not likeable target is specified"
      super("#{msg}, #{target}")
    else
      super("Like target is not present")
    end
  end
end
