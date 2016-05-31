module API
  class HeartbeatController < ApplicationController
    def status
      render json: { message: 'OK' }, status: 200
    end
  end
end
