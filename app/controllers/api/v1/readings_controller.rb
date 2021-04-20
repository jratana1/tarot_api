class Api::V1::ReadingsController < ApplicationController
    def index

        readings = current_user.readings.last(5)
        render json: ReadingSerializer.new(readings)
    end

    def create
   
        reading = Reading.new(:user_id => current_user.id, :question => params[:question])

        reading.cards << Card.find(params[:cards][0])
        reading.cards << Card.find(params[:cards][1])
        reading.cards << Card.find(params[:cards][2])
        if reading.save
      
            readings = current_user.readings.last(5)
            render json: ReadingSerializer.new(readings)
        end
    end
end
