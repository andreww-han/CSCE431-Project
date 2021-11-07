class AnnouncementsController < ApplicationController
  def index
    if Member.exists?(uid: current_admin.uid) == false
      redirect_to(new_member_path) 
    else
      @current_member = Member.where(uid: current_admin.uid).first()

      @is_admin = @current_member.isAdmin
    end

    @announcements = Announcement.order('created_at DESC')

    if @is_admin
      @announcement = Announcement.new
    end
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)

    # we make sure that all fields have been filled in order to prevent any errors later on:
    unless verify(@announcement)
      @error = 'make sure to fill all fields!'
      render('new')
      return
    end

    if @announcement.save
      @flash_notice = 'announcement added successfully.'
      redirect_to(announcements_path, notice: @flash_notice)
    else
      render('index')
    end
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update(announcement_params)
      @flash_notice = 'announcement updated successfully.'
      redirect_to(announcements_path, notice: @flash_notice)
    else
      @error = true
      render('edit')
    end
  end

  def delete
    @announcement = Announcement.find(params[:id])
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    @flash_notice = 'announcement deleted successfully.'
    redirect_to(announcements_path, notice: @flash_notice)
  end

  private def announcement_params
    params.require(:announcement).permit(:title, :message)
  end

  def verify(announcement)
    if announcement.title.empty? or announcement.message.empty?
      return false
    else
      return true
    end
  end
end
