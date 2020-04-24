class ApplicationController < ActionController::Base
  def set_prop_data(data) # data: hash
    @prop_data = JSON.generate(data)
  end

  def render_404(e = nil)
    head 404
  end
end
