class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]

  def index
    params[:tag] ? @posts = Post.tagged_with(params[:tag]) : @posts = Post.all
    @pagy, @posts = pagy(@posts.order(created_at: :desc))
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params.merge(user: current_user))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post criado com sucesso." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post atualizado com sucesso." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post removido com sucesso." }
    end
  end

  def import
    posts_file = File.open(params[:file])
    post = helpers.sanitize posts_file.read, tags: %w(article h1 main em)
    AddImportedPostWorker.perform_async(post, current_user.id)
    redirect_to posts_path, notice: "Os posts estão sendo processados e em breve serão adicionados!"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :tag_list, :tag, { tag_ids: [] }, :tags_ids)
  end
end
