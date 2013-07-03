class Skill < ActiveRecord::Base
	has_many :users, through: :proficiencies
	has_many :proficiencies

	validates_uniqueness_of :name

	def user_with_proficiency(value)
		self.proficiencies.where(proficiency: value).first.user
	end

end
