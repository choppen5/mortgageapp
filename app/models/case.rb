class Case < ActiveRecord::Base

  belongs_to :user
  belongs_to :company

  has_many :activities


end
