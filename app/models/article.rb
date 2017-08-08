class Article < ApplicationRecord
  belongs_to :report
  attr_accessor :image
end
