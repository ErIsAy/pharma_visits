class EventsController < ApplicationController
  # before_action :set_event, only: [:show, :edit, :update, :destroy]

  def scheduler
    # @events = Event.all
    # @events = current_user.plannings
    # @now = DateTime.now
    # @period = Cycle.last.period
    # @user = current_user
    # @event = (:note)

    if params[:q] == nil 
      @user = current_user
    else
      @user = User.find(params[:q]["user_id_eq"])
    end

    
    if current_user.admin
      @q = Planning.ransack(params[:q])
      @plannings = @q.result
      @events = @plannings
      @now = DateTime.now
      @period = Cycle.last.period
      @event = (:note) 
      # byebug
    else
      @events = current_user.plannings
      @now = DateTime.now
      @period = Cycle.last.period
      @event = (:note)    
    end


  end

  def index
    # @events = Event.all
    # @events = current_user.plannings
    # @now = DateTime.now
    # @period = Cycle.last.period
    # @visits = Visit.all
    # @plannings = Planning.all

    #find the user id in the request
    if request.env['HTTP_REFERER'] != nil 
      @params = request.env['HTTP_REFERER'].sub(request.base_url, '')
      @inc = @params.include?("user_id_eq")
      @p = @params[47]

      if @inc
        @user = User.find(@p)
      else
        @user = current_user
      end
    else
      @user = current_user
    end


    
    
    if current_user.admin
      @q = Planning.ransack(params[:q])
      # @plannings = @q.result
      @events = @user.plannings
      @now = DateTime.now
      @period = Cycle.last.period
      @event = (:note) 
      # byebug
      
    else
      @events = @user.plannings
      @now = DateTime.now
      @period = Cycle.last.period
      @event = (:note)    
    end

    # byebug
    # respond_to do |format|
    #   byebug
    #   format.json 
    #   format.js { render :js => "console.log('wow')" }
    # end

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
                                  :visited, :note, :user_id)
  end
end
