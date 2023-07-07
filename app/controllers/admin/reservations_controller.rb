class Admin::ReservationsController < ApplicationController
    before_action :authenticate_admin!
    
    def index
        @search=Reservation.includes(:customer).ransack(params[:q])
        @reservations=@search.result.page(params[:page]).per(20)
    end
    
    def show
        @reservation=Reservation.find(params[:id])
        @customer = @reservation.customer
    end
    
    def update
        @reservation=Reservation.find(params[:id])
        @customer = @reservation.customer
    end
    
    private
        def reservation_params
            params.require(:reservation).permit(:customer_id, :date_and_time, :number_of_people, :status)
        end
end