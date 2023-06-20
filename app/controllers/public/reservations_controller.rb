class Public::ReservationsController < ApplicationController
    before_action :authenticate_customer!
    
    def index#予約情報入力画面
      @reservation=Reservation.new
    end
    
    def show#予約情報確認画面
     　@reservations=Reservation.find(params[:id])
       @reservation_status=@reservation.reservation_status
    end
    
    def create
        @reservation=Reservation.find(params[:id]).reservations.build(reservation_params)
        @reservation.customer_id=current_customer.id
        # customer=current_customer
        session[:reservation]=Reservation.new
        # @customer.id = current_customer.id
        @customers= Customer.all
        @customer=current_customer
        if session[:reservation][:name].presence && session[:order][:email].presence
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
    
    def confirm
      @reservaton=Reservation.new(reservaton_params)
      @number_of_people=NumberOfPeople.find(params[:reservaton][:number_of_people_id])
      @reservaton.date_and_time= @number_of_people.date_and_time
      @reservaton.number_of_people= @number_of_peoples.number_of_people
      @reservaton.name=@number_of_people.name
    end
    
    private
    def reservation_params
      params.require(:reservation).permit(:payment_methods, :name, :number_of_people, :date_and_time)
    end
end
