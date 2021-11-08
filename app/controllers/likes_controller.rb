class LikesController < ApplicationController
  before_action :set_like, only: %i[ show edit update destroy ]

  # GET /likes or /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1 or /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @post_id = params[:post_id]
    @member_id = params[:member_id]
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes or /likes.json
  def create
    @like = Like.new(like_params)
    @post_id = params[:post_id]
    @post = Post.find(params[:post_id])
    
    respond_to do |format|
      if @like.save
        @post_likes = Like.where(post_id: @post_id).pluck('DISTINCT member_id').count
        Post.update(@post_id, :likes => @post_likes)
        format.html { redirect_to @post, notice: "You have liked this post." }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
      
  end

  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: "Like was successfully updated." }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def delete
    @like = Like.find(params[:id])
    @post = Post.find(params[:post_id])
    @post_id = params[:post_id]
    @like.destroy
    @post_likes = Like.where(post_id: @post_id).pluck('DISTINCT member_id').count
    Post.update(@post_id, :likes => @post_likes)
    respond_to do |format|
      format.html { redirect_to @post, notice: "You have un-liked this post." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      # params.fetch(:like, {:meeting_id, :member_id})
      params.permit(:post_id, :member_id)
    end
end
