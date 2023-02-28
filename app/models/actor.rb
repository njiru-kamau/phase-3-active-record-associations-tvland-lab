class Actor < ActiveRecord::Base
    has_many :shows, through: :characters

    def full_name
        Actor.find_by(first_name: self.first_name, last_name: self.last_name)
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        characters.map { |character| "'#{self.full_name} - #{}'" }
        characters.map { |character| "#{character.name} - #{character.show.name}" }
    end
end
end