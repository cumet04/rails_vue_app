class ApplicationController < ActionController::Base
  before_action { @prop_data = {} }

  # override ActionController::ImplicitRender for omitting view file per action
  def default_render
    render(html: "", layout: true)
  end

  def set_prop_data(data) # data: hash
    @prop_data = JSON.generate(data)
  end

  def warden
    request.env["warden"]
  end

  def current_user
    warden.user
  end

  def render_404(e = nil)
    head 404
  end
end
