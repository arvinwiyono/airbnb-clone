class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  # User must be authneticated before every controller action, except for show
  before_action :authenticate_user!, except: [:show]

  def new
    @room = current_user.rooms.build
  end

  def show
    @photos = @room.photos
  end

  def index
    @rooms = current_user.rooms
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end

      @photos = @room.photos
      redirect_to edit_rooms_path (@room), notice: "Saved"
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end
      redirect to edit_rooms_path(@room), notice: "Updated"
    else
      render :edit
    end
  end

  def edit
    if current_user.id == @room.user.id
     @photos = @room.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(
        :home_type, :room_type, :accomodate,
        :bedroom, :bathroom, :listing_name,
        :summary, :address, :is_tv, :is_kitchen,
        :is_air, :is_heating, :is_internet, :price, :active
    )
  end
end
