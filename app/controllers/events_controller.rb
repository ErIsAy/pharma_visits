class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def scheduler
    # @events = Event.all
    @events = current_user.plannings
    @now = DateTime.now
    @period = Cycle.last.period
    @user = current_user
    @event = (:note)

    # @visits = Visit.all
    # @plannings = Planning.all
  end

  def index
    # @events = Event.all
    @events = current_user.plannings
    @now = DateTime.now
    @period = Cycle.last.period
    # @visits = Visit.all
    # @plannings = Planning.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
    @user = current_user
    # byebug
  end

  def create
    # byebug
    @note = params[:note]["note"]
    @user = User.find(current_user.id)
    @user.note = @note
    # @user.save

    respond_to do |format|
      if @user.save
        format.html { redirect_to scheduler_events_path, notice: 'Nota Actualizada' }
        # format.json { render :show, status: :ok, location: @drugstore }
      else
        format.html { render :edit }
        # format.json { render json: @drugstore.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to @drugstore
    # @user = current_user
    # @event = Event.new(event_params)
    # @event.save
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date_range, :start, :end, :color,
                                  :visited, :note)
  end
end
