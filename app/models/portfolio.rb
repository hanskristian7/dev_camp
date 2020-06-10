class Portfolio < ApplicationRecord
    include Placeholder
    has_many :technologies
    accepts_nested_attributes_for :technologies,
                                    reject_if: lambda { |attrs| attrs['name'].blank? }

    before_save :default_images

    def self.by_position
        order("position ASC")
    end
    
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
