class BlogPost < ApplicationRecord
  validates_presence_of :title, :message => "Tiêu đề không được trống"
  validates_presence_of :body, :message => "Phần thân của blog không được trống !!!"
end
