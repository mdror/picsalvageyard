class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @search = Comment.search do
      fulltext params[:search]
    end
    @comments = @search.results

    #@image = Image.find(params[:id])
    #@image = Image.find_by_id(params[:image_id])
     #
  end

  def new
  end

  def show
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end




