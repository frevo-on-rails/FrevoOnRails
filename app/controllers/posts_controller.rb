class PostsController < ApplicationController
  respond_to :html, :atom

  def index
    @posts = Post.all
    respond_with @posts
  end

  def show
    @post = Post.find_by_permalink params[:id]
    respond_with @post
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def edit
    @post = Post.find_by_permalink params[:id]
  end

  def create
    @post = Post.new params[:post]
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find params[:id]
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
