class Pin < ActiveRecord::Base
  acts_as_votable
  belongs_to :user

  validates :title, :description, length: { in: 3..86 }
  validates :image, :title, :description, presence: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
