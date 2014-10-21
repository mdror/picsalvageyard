class ImagesController < ApplicationController
 #before_action :authenticate_user!

  def index
    @images = Image.rescued
    #@images = Image.update_attribute(:rescued, true) if @image.comment.any?
    #@images = @images.rescued
  end

  def rescued
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
    @image.tag_list = ""
    @image_tag = Image.find(params[:id])
  end

  def tags
    @images = Image.tagged_with(params[:tag])#['hi1', 'hi2']['hi1', 'hi2'] #.each do |tag| (params[:tag])#['hi1', 'hi2']

    #if params[:tag].present?
      #@tags = Image.tagged_with(params[:tag])
  end
  #end
  #raise 'Hi THERE'




  def create
    @image = Image.new(image_params)
    #@image.rescued = true if @image.comments.any?
    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  ##

##

  end

  def upload
  uploaded_io = params[:image]
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename),
   'wb') do |file|
    file.write(uploaded_io.read)
    end
  end

  def update
    @image = Image.find(params[:id])
    unless @image.tag_list.empty?
      #add new tags
      @image.tag_list.add(params[:image][:tag_list], parse: true)
    end
    #params[:image][:rescued] = true if @image.comments.any?

    if @image.update_attributes(image_params.except(:tag_list))
      redirect_to @image
    else
      render 'new'
    end
  end

 # currently deprecated?
 def tagged
   if params[:tag].present?
     @image = Image.tagged_with(params[:tag])
   else
     @image = Image.all
   end
 end
#acts_as_taggable_on :tags

  private

  def image_params   #4.29 added :tag_list to permit
    params.require(:image).permit(:image, :rescued, :tag_list, comments_attributes: [:content])
  end





end
