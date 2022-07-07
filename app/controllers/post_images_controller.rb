class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    post_image = PostImage.new(post_image_params)
    # 投稿のIDにログイン中のユーザのIDを代入し、現在のユーザが投稿したようにする
    # user_idは投稿時に指定していない（ユーザには自分のuserモデルのIDは分からない）からここで指定してあげる必要がある
    post_image.user_id = current_user.id
    post_image.save
    redirect_to post_image_path(post_image.id)
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end


private
def post_image_params
  params.require(:post_image).permit(:image, :shop_name, :caption)
end

end
