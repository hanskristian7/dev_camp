class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies,
                                    allow_destroy: true,
                                    reject_if: lambda { |attrs| attrs['name'].blank? }


    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image,PortfolioUploader

    def self.by_position
        order("position ASC")
    end
    
    validates :title, presence: true
    validates :body, presence: true

    def self.angular
        where(subtitle: "Angular")
    end

    scope :ruby_on_rails_portfolio, -> { where(subtitle: "Ruby on Rails") }
end
