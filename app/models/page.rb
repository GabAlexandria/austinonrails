class Page < ActiveRecord::Base

  def to_param
    slug.to_s
  end

end
