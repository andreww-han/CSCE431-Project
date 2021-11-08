class MembersController < ApplicationController
    def index

      @members = Member.order('created_at DESC')

      @current_member = Member.where(uid: current_admin.uid).first()

      @posts = Post.all
      @bios = Bio.all

      if @current_member.isAdmin == true
        @is_admin = true
      else
        @is_admin = false
      end

      if @is_admin
        @member = Member.new
      end

    end

    def new
      @member = Member.new
    end

    def create
      @member = Member.new(member_params)

      # we make sure that all fields have been filled in order to prevent any errors later on:
      unless verify(@member)
        @error = 'make sure to fill all fields!'
        render('new')
        return
      end

      if @member.save
        @flash_notice = 'Member added successfully.'
        redirect_to(members_path, notice: @flash_notice)
      else
        render('index')
      end
    end

    def show
      @member = Member.find(params[:id])
      @posts = Post.all
      @bios = Bio.all
    end

    def edit
      @member = Member.find(params[:id])
    end

    def update
      @member = Member.find(params[:id])
      if @member.update(member_params)
        @flash_notice = 'Member updated successfully.'
        redirect_to(members_path, notice: @flash_notice)
      else
        @error = true
        render('edit')
      end
    end

    def delete
      @member = Member.find(params[:id])
    end

    def destroy
      @member = Member.find(params[:id])
      @member.destroy
      @flash_notice = 'Member deleted successfully.'
      redirect_to(members_path, notice: @flash_notice)
    end

    private def member_params
      params.require(:member).permit(:name, :totalPoints, :isAdmin, :isOwner, :uid, :email)
    end

    def verify(member)
      if member.name.empty?
        return false
      else
        return true
      end
    end
  end
