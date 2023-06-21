class Public::ReservationsController < ApplicationController
    before_action :authenticate_customer!
    
    def new#予約情報入力画面
      @reservation=Reservation.new
    end
    
    def create
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        redirect_to public_reservation_path(@reservation)
      else
        redirect_to new_public_reservation_path
      end
    end
    
    def index
      # @reservations=current_customer.reservations
    end
    
    def show#予約情報確認画面
      # @reservation=Reservation.find(params[:id])
      @reservations=Reservation.all
    end
    
    def thanks #サンクスページ
    end
    
    
    private
    def reservation_params
      params.require(:reservation).permit(:payment_method, :name, :number_of_people, :date_and_time, :customer_id)
    end
end
