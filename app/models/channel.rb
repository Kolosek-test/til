# frozen_string_literal: true

class Channel < ApplicationRecord
  include WithEntries

  validates :name, presence: true
  has_many :posts

  def to_param
    name
  end

  def posts_count
    posts.published.count
  end
end
