class Portfolio < ApplicationRecord
    before_save :default_images

    validates :title, presence: true
    validates :body, presence: true

    def default_images
        self.main_image ||= "https://place-hold.it/600x400" if self.main_image.nil?
        self.thumb_image ||= "https://place-hold.it/350x200" if self.thumb_image.nil?
    end

    def self.angular
        where(subtitle: "Angular")
    end

    scope :ruby_on_rails_portfolio, -> { where(subtitle: "Ruby on Rails") }
end
