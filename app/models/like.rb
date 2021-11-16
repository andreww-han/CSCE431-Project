class Like < ApplicationRecord
  validates :member_id, presence: true
  validates :post_id, presence: true

  def delete
    @like = Like.find(params[:id])
    @post = Post.find(params[:post_id])
    @post_id = params[:post_id]
    @like.destroy
    @post_likes = Like.where(post_id: @post_id).pluck('DISTINCT member_id').count
    Post.update(@post_id, likes: @post_likes)
    respond_to do |format|
      format.html { redirect_to @post, notice: 'You have un-liked this post.' }
      format.json { head :no_content }
    end
  end
end
