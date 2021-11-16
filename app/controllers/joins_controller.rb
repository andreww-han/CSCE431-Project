class JoinsController < ApplicationController
  def new
    @meeting_id = params[:meeting_id]
    @member_id = params[:member_id]
    @join = Join.new
  end

  def create
    @join = Join.new(join_params)
    @join.save
    redirect_to(meetings_path)
  end

  private def join_params
    params.require(:join).permit(:meeting_id, :member_id)
  end
end
