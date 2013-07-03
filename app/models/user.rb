class User < ActiveRecord::Base
	has_many :proficiencies
	has_many :skills, through: :proficiencies

	validates :email, uniqueness: true, presence: true

	def proficiency_for(skill)
		proficiency = self.proficiencies.where(skill_id: skill.id).first
		proficiency.blank? ? 0 : proficiency.proficiency
	end

	def set_proficiency_for(skill,value)
		user = self.proficiencies.where(skill_id: skill.id).first
		user.update_attributes(proficiency: value)
	end

end
