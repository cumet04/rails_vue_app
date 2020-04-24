class ApplicationController < ActionController::Base
  def render_404(e = nil)
    head 404
  end
end
