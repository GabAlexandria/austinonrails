class Video < ActiveRecord::Base

  scope :featured, -> { where(featured: true) }

end
