class Parser < ApplicationRecord
  has_many :parser_records, -> { order(created_at: :asc) }, dependent: :destroy
  validates :main_url, :record_list_tag, :record_tag, :header_tag, :content_tag, presence: true
  validates :name, uniqueness: true
end
