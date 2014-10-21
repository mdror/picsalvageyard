class CommentsController < ApplicationController
  #before_action :authenticate_user!

  def index
    @search = Comment.search do
      fulltext params[:search]
    end
    @comments = @search.results

    #@image = Image.find(params[:id])
    #@image = Image.find_by_id(params[:image_id])
     #
  end

#   def index
#    @search = Comment.search do
#      keywords params[:query]
#    end
#    @posts = @search.results
#  end
# end

  def new
  end

  def show
  end

  def create
  end




end
