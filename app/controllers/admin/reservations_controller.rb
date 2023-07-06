class Admin::ReservationsController < ApplicationController
    before_action :authenticate_admin!
    
    def index
        @search=Reservation.ransack(params[:q])
        @reservations=@search.result.page(params[:page]).per(20)
    end
    
    def show
        @reservation=Reservation.find(params[:id])
        @reservation.customer=Customer.find(params[:id])
    end
    
    # def update
    #     @reservation=Reservation.find(params[:id])
    #     reservation_status=reservation.reservation_status
    #     reservation.update(reservation_params)
    #         if reservation.reservation_status=="入金確認"
    #             reservation_items.update_all(making_status: "製作中")
    #         end
    #         redirect_to admins_reservation_path(reservation.id)
    # end
    
    private
        def reservation_params
            params.require(:reservation).permit(:reservation_status)
        end
end