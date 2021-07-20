class Admin::PostsController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?

  def index
    @posts = Post.all.order(:id)
    @breadcrumbs = [[t('posts.name'), admin_posts_url]]
  end

  def new
    @post = Post.new
    @labs = Lab.all.order(:id)
    @breadcrumbs = [[t('posts.name'), admin_posts_url], [t('posts.new'), new_admin_post_url]]
  end

  def create
    @post = Post.new(new_post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to  admin_posts_path
    else
      @labs = Lab.all.order(:id)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    @labs = Lab.all.order(:id)
    @breadcrumbs = [[t('posts.name'), admin_posts_url], [t('posts.edit'), edit_admin_post_url(params[:id])]]
  end

  def update
    @post = Post.find(params[:id])
    if@post.update(eidt_post_params)
      redirect_to  admin_posts_path
    else
      @labs = Lab.all.order(:id)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.remove_image!
    @post.save
    @post.delete
    redirect_to  admin_posts_path
  end

  private
    def new_post_params
      params.require(:post).permit( :title, :short_content, :full_content, :lab_id, :image, :file)
    end

    def eidt_post_params
      params.require(:post).permit( :title, :short_content, :full_content, :lab_id, :image, :file)
    end
end
