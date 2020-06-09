class Portfolio < ApplicationRecord
    include Placeholder
    before_save :default_images

    has_many :technologies
    
    validates :title, presence: true
    validates :body, presence: true

    def default_images
        self.main_image ||= Placeholder.image_generator(600, 400) if self.main_image.nil?
        self.thumb_image ||= Placeholder.image_generator(350, 200) if self.thumb_image.nil?
    end

    def self.angular
        where(subtitle: "Angular")
    end

    scope :ruby_on_rails_portfolio, -> { where(subtitle: "Ruby on Rails") }
end
