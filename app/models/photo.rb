class Photo < ActiveRecord::Base

  belongs_to :album


  scope :featured, -> { where(featured: true) }
end
