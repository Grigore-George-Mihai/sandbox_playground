# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    query = params.dig(:search, :query)
    @posts = query.present? ? Post.search(query, fields: [:title], match: :word_start) : Post.all

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("posts", partial: "posts/partials/list", locals: { posts: @posts })
      end
      format.html
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def autocomplete
    render json: Post.search(params[:query], fields: [:title], match: :word_start, limit: 10).map(&:title).uniq
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
