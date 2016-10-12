class Algorithm < ActiveRecord::Base
	validates :name, :description, :link, :author, presence: true
	#ensure each algorithm has a unique name
	validates :name, uniqueness: true
	validates :difficulty, numericality: { numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}}
	validates :link, allow_blank: true, format: {
  with: %r{\.(gif|jpg|png|jpeg)\Z}i,
  message: 'must be a URL for GIF, JPG or PNG image.'
}
end
