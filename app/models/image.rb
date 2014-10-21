class Image < ActiveRecord::Base


  has_many :comments


  accepts_nested_attributes_for :comments


  scope :not_rescued, -> { where(rescued: false) }
  scope :rescued, -> { where(rescued: true) }

  before_save :update_rescue



  def update_rescue
    self.rescued = true if self.filled_out_comments.any?
  end

  def filled_out_comments
    self.comments.reject{|c| c.content.empty? }
  end


end
