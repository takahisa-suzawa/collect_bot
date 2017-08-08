class Report < ApplicationRecord
  has_many :articles, :dependent => :nullify

  def self.find_accepting_report(target_date)
    self.where("accepted_date < ? and report_date is null", target_date).first
  end
end
