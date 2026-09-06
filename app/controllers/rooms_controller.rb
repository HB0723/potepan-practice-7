class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:search, :show]

  def index
    @rooms = current_user.rooms.order(created_at: :desc)
  end

  def search
    @rooms = Room.all

    if params[:area].present?
      @rooms = @rooms.where("address LIKE ?", "%#{params[:area]}%")
    end

    if params[:keyword].present?
      keyword = "%#{params[:keyword]}%"
      @rooms = @rooms.where("name LIKE ? OR description LIKE ?", keyword, keyword)
    end
  end

  def show
    @room = Room.find(params[:id])

    if user_signed_in? && params[:reservation_id].present?
      original_reservation = current_user.reservations.find_by(
        id: params[:reservation_id],
        room_id: @room.id
      )
    end

    if original_reservation
      @reservation = Reservation.new(
        checkin_at: original_reservation.checkin_at,
        checkout_at: original_reservation.checkout_at,
        guest_count: original_reservation.guest_count
      )

      @rebooking = true
    else
      @reservation = Reservation.new
      @rebooking = false
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(room_params)

    if @room.save
      redirect_to @room, notice: "施設を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @room = current_user.rooms.find(params[:id])
  end

  def update
    @room = current_user.rooms.find(params[:id])

    if @room.update(room_params)
      redirect_to @room, notice: "施設を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room = current_user.rooms.find(params[:id])
    @room.destroy

    redirect_to rooms_path, notice: "施設を削除しました"
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end
end
