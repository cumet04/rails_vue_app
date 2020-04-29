class ViewData::Base
  class << self; protected :new; end

  def initialize(args) # args: Hash
    args.each do |k, v|
      self.send("#{k}=", v)
    end
  end

  def self.generate_nullable(obj)
    obj && generate(obj)
  end

  def to_json(args)
    # tmp
    self.as_json.to_json
  end
end
