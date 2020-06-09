class Skill < ApplicationRecord
    include Placeholder

    validates :title, presence: true

    after_initialize :set_defaults
    def set_defaults
        self.badge ||= Placeholder.image_generator(350, 200)
    end
end
