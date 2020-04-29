class ApplicationController < ActionController::Base
  before_action do
    view_props[:user] = ViewData::User.generate_nullable(current_user)
  end

  ### helpers
  def view_props
    @_view_props ||= {}
  end

  def page_props
    # This key is read in frontend layout file
    view_props[:pageProps] ||= {}
  end

  def warden
    request.env["warden"]
  end

  def current_user
    warden.user
  end

  # override ActionController::ImplicitRender for omitting view file per action
  def default_render
    render(html: "", layout: true)
  end

  def render_404(e = nil)
    head 404
  end
end
