class Public::ReservationsController < ApplicationController
    before_action :authenticate_customer!
    
    def index#予約情報入力画面
      @reservation=Reservation.new
      @customer=current_customer
    end
    
    def show#予約情報確認画面
     　@reservation=Reservation.find(params[:id])
       @reservation_status=@reservation.reservation_status
    end
    
    def create
        # customer=current_customer
        session[:reservation]=Reservation.new
        # @customer.id = current_customer.id
        @customers= Customer.all
        @customer=current_customer
        if session[:reservation][:name].presence
          redirect_to new_public_reservation_path
        else
          redirect_to public_reservations_path
        end
        # if @customer.save!
        #   redirect_to public_order_path
        # else
        #   render :about
        # end
    end
    
    def new
      @reservatons=current_customer.name
    end
    
    def thanks #サンクスページ
      reservation=Reservation.new(session[:reservation])
      reservation.save
    end
    
    private
    def reservation_params
      params.require(:reservation).permit(:payment_methods, :name, :number_of_people, :date_and_time)
    end
end
