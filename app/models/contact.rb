class Contact < ActiveRecord::Base
	validates :firstname, presence: true
	validates :lastname, presence: true

	def name
		[firstname,lastname].join ' '
	end

	def self.filter_by_name(search_term)
		where("lastname LIKE ?",search_term).order(:lastname)
	end
end
