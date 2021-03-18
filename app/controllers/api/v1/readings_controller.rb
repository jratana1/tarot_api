class Api::V1::ReadingsController < ApplicationController
    def index
        readings = Reading.all
        render json: ReadingSerializer.new(readings)
    end
end
