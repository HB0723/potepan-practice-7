class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations.order(created_at: :desc)
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def confirm
    @room = Room.find(params[:room_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.room = @room

    if @reservation.valid?
      render :confirm
    else
      render "rooms/show", status: :unprocessable_entity
    end
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.room = @room

    if @reservation.save
      redirect_to reservations_index_path, notice: "予約が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy

    redirect_to reservations_index_path, notice: "予約を削除しました"
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :checkin_at,
      :checkout_at,
      :guest_count
    )
  end
end
