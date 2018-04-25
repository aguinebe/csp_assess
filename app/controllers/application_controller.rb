class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    NotAuthorized = Class.new(StandardError)
  # ...or if you really want it to be ActionController
  # NotAuthorized = Class.new(ActionController::RoutingError)

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_error_page(status: 404, text: 'Not found')
  end

  rescue_from ApplicationController::NotAuthorized do |exception|
    render_error_page(status: 403, text: 'Forbidden')
  end

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end

  private

  def render_error_page(status:, text:, template: 'errors/routing')
    respond_to do |format|
      format.json { render json: {errors: [message: "#{status} #{text}"]}, status: status }
      format.html { render template: template, status: status, layout: false }
      format.any  { head status }
    end
  end
  
end
