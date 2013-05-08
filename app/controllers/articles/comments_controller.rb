class Articles::CommentsController < ApplicationController
  clear_respond_to
  respond_to :html

  before_filter :find_article

  def create
    @comment = Comment.new(comments_params)
    @comment.article = @article

    if @comment.valid?
      redirect_to @article, :notice => 'Comment was successfully created.'
    else
      render "articles/show"
    end
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def comments_params
    params.require(:comment).permit :name, :body
  end
end
