class Site < ApplicationRecord
  has_many :site_entries, -> { order(created_at: :asc) }, dependent: :destroy
  validates :main_url, :entry_list_tag, :entry_tag, :header_tag, :content_tag, presence: true
  validates :name, uniqueness: true

  def self.search(search)
    if search
      where("lower(name) LIKE ?", "%#{search.downcase}%")
    else
      all
    end
  end
end