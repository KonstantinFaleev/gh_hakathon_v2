class SiteEntry < ApplicationRecord
  belongs_to :site
  validates :link, :header, :content, presence: true
  validates :link, uniqueness: true

  def transformed_content
    max_paragraphs = 3
    paras = content.split("\n")
    arr = paras[0...max_paragraphs]
    arr.map! {|p| "<p>#{p}</p>"}
    val = arr.join(' ')
    val += '...' if paras.length > max_paragraphs
    val
  end

  def self.search(search)
    if search
      where("lower(name) LIKE ?", "%#{search.downcase}%")
    else
      all
    end
  end
end