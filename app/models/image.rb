class Image < ActiveRecord::Base


  has_many :comments


  accepts_nested_attributes_for :comments, reject_if: :all_blank


  scope :not_rescued, -> { where(rescued: false) }
  scope :rescued, -> { where(rescued: true) }

  before_save :update_rescue

  mount_uploader :image, ImageUploader


  def update_rescue
    self.rescued = comments.any?
    true
  end



end

