class Tagging < ActiveRecord::Base
  belongs_to :algorithm
  belongs_to :inventor
end
