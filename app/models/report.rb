class Report < ApplicationRecord
  has_many: articles, :dependent => :nullify
end
