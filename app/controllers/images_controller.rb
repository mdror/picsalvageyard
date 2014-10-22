class ImagesController < ApplicationController
 before_action :authenticate_user!

  def index
    @images = Image.rescued
    #@images = Image.update_attribute(:rescued, true) if @image.comment.any?
    #@images = @images.rescued
  end

  def rescue
    @images = Image.not_rescued

  end

  def new
    @image = Image.new
  end

  def show

    #if params[:tag]
      #@image = Image.tagged_with(params[:tag]) &&
    #else

    @image = Image.find(params[:id])
    @comment = @image.comments

  end



  def create
  @user = Image.create(image_params)
    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:image, :rescue, comments_attributes: [:content])
  end
end





# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.



  # def upload
  # uploaded_io = params[:image]
  # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename),
  #  'wb') do |file|
  #   file.write(uploaded_io.read)
  #   end
  # end

  # def update
  #   @image = Image.find(params[:id])
  #   unless @image.tag_list.empty?
  #     #add new tags
  #     @image.tag_list.add(params[:image][:tag_list], parse: true)
  #   end
  #   #params[:image][:rescued] = true if @image.comments.any?

  #   if @image.update_attributes(image_params.except(:tag_list))
  #     redirect_to @image
  #   else
  #     render 'new'
  #   end
  # end




