class MemberPointsController < ApplicationController
  before_action :set_member_point, only: %i[show edit update destroy]

  # GET /member_points or /member_points.json
  def index
    @member_points = MemberPoint.where(member_id: params[:member_id])
  end

  # GET /member_points/1 or /member_points/1.json
  def show; end

  # GET /member_points/new
  def new
    @member_point = MemberPoint.new
  end

  # GET /member_points/1/edit
  def edit; end

  # POST /member_points or /member_points.json
  def create
    @member_point = MemberPoint.new(member_point_params)
    @member_id = params[:member_id]
    @member = Member.find(@member_id)
    @event_id = params[:event_id]
    @event = Event.find(@event_id)
    @activity = Activity.find(@event.activity_id)
    @new_points = @member.totalPoints + @activity.num_points

    respond_to do |format|
      if @member_point.save
        Member.update(@member_id, totalPoints: @new_points)
        format.html { redirect_to @event, notice: 'You have checked into this event.' }
        format.json { render :show, status: :created, location: @member_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_points/1 or /member_points/1.json
  def update
    respond_to do |format|
      if @member_point.update(member_point_params)
        format.html { redirect_to @event, notice: 'Member point was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_points/1 or /member_points/1.json
  def destroy
    @member_point.destroy
    respond_to do |format|
      format.html { redirect_to member_points_url, notice: 'Member point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member_point
    @member_point = MemberPoint.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def member_point_params
    params.permit(:date, :points, :event_id, :member_id, :activity_id)
  end
end
