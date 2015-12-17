class ReservationsController < ApplicationController
	before_action :authenticate_user!

	def preload
		room = Room.find(params[:room_id])
		today = Date.today
		reservations = room.reservations.where("start_date >= ? OR end_date >= ?", today, today)

		render json: reservations	
	end

	def create
		@reservation = current_user.reservations.create(reservation_params)

		redirect_to @reservation.room, notice: "Your reservation has been created..."
	end

	private
		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date, :price, :total, :room_id)
		end
end