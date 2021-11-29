class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates :title, :body, presence: true

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    has_rich_text :body

    def self.tagged_with(name)
        Tag.find_by!(name: name).posts
    end

    def self.tag_counts
        Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
    end

    def tag_list
        tags.map(&:name).join(', ')
    end

    def tag_list=(names)
        self.tags = names.split(',').map do |n|
        Tag.where(name: n.strip).first_or_create!
        end
    end
end
