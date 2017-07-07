class MetricController < ApplicationController
  def index
    # @users = User.joins(:plannings)
    # @users = User.where(id: Planning.pluck(:user_id))
    # @plannings = Planning.all


    # #
    # if params[:q]
    #   @q = User.where(id: Planning.pluck(:user_id)).ransack(params[:q])
    #   @users = @q.result.includes(:plannings).where(id: Planning.pluck(:user_id))
    #   # @q = User.includes(:plannings).where.not(plannings: { id: nil }).where(id: Planning.pluck(:user_id)).ransack(params[:q])
    #   # @users = @q.result.includes(:plannings)
    # else
    #   @q = User.where(id: Planning.pluck(:user_id)).ransack(params[:q])
    #   @users = @q.result.includes(:plannings).where(id: Planning.pluck(:user_id))
    # end


    # @q = User.ransack(params[:q])
    # @users = @q.result.includes(:plannings).where.not(plannings: { id: nil })
    #

    #
    #
    # if params[:q] == ''
    #   @q = Planning.ransack(params[:q])
    #   @plannings = @q.result.includes(:cycle)
    #   @plannings = @plannings.group(:user_id)
    #   # @plans_no = Planning.joins(:cycle).count
    #   # @plans_no = Planning.all
    # else
      @q = Planning.ransack(params[:q])
      @plannings = @q.result.includes(:cycle)
      @plannings = @plannings.group(:user_id, :planning_id)
      @cycles = Cycle.all



      # @plans_no = Planning.joins(:cycle).count
      # @plans_no = Planning.joins(:cycle).where(cycles: {name: params[:q]}).count
    # end


    # @q = User.ransack(params[:q])
    # @users = @q.result.includes(:plannings)


    # @q = Planning.ransack(params[:q])
    # @plannings = @q.result.includes(:user)
    # @plannings = @plannings.distinct.pluck(:user_id).uniq
    # debugger


    # if params[:search]
    #   @users = User.where(id: Planning.pluck(:user_id))
    #
    #   # debugger
    #   # @users = User.joins(:plannings).where(:plannings => {:created_at => params[:search]})
    #   # @users = User.joins('LEFT JOIN plannings on plannings.user_id = user.id')
    #   #               .group('user.id')
    #   #               .having("created_at > #{params[:search]}")
    #   # @doctors = Doctor.where(:firstname => params[:search]).paginate(:page => params[:page], :per_page => 20)
    # else
    #
    #   @users = User.where(id: Planning.pluck(:user_id))
    # end


  end
end
