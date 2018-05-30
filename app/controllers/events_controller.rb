class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def scheduler
    # @events = Event.all
    @events = current_user.plannings
    @now = DateTime.now
    @period = Cycle.last.period


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
  end

  def create
    @event = Event.new(event_params)
    @event.save
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
