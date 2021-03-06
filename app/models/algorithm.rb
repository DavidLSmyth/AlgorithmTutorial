class Algorithm < ActiveRecord::Base
	ALGORITHM_LANGUAGES=["pseudoCode","Python","Cpp","Java","Ruby"]
  acts_as_taggable
	validates :name, :description, :link, :author, presence: true
	#ensure each algorithm has a unique name
	validates :name, uniqueness: true
	validates :difficulty, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
	validates :link, allow_blank: true, format: {
  		with: %r{\.(gif|jpg|png|jpeg)\Z}i,
  		message: 'must be a URL for GIF, JPG or dirPNG image.'
	}
	def self.searchbar(search)
		where("name LIKE ?", "%#{search}%") 
	end
end
