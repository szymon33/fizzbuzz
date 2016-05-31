module API
  class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session,
                         if: proc { |c| c.request.format == 'application/json' }

    def render_not_found
      render json: { error: 'Not Found' }.to_json, status: 404
    end
  end
end
