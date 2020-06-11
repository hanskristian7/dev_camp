class Blog < ApplicationRecord
    belongs_to :topic
    has_many :comments, dependent: :destroy

    enum status: {draft: 0, published: 1}
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates :title, presence: true
    validates :body, presence: true

    def self.recent
        order("created_at DESC")
    end
end
