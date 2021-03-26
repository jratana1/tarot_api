class Api::V1::ReadingsController < ApplicationController
    def index
        readings = Reading.all
        render json: ReadingSerializer.new(readings)
    end

    def create
        reading = Reading.new(:user_id => 1, :question => params[:question])

        reading.cards << Card.find(params[:cards][0])
        reading.cards << Card.find(params[:cards][1])
        reading.cards << Card.find(params[:cards][2])
        if reading.save
            readings = User.find(1).readings.last(5)
            render json: ReadingSerializer.new(readings)
        end
    end
end
