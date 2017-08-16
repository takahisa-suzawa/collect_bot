class Report < ApplicationRecord
  has_many :articles,:infomations :dependent => :nullify
end
