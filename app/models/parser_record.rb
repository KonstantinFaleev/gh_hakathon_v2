class ParserRecord < ApplicationRecord
  belongs_to :parser
  validates :link, :header, :content, presence: true
  validates :link, uniqueness: true

  def content
    max_paragraphs = 10
    paras = content.split("\n")
    arr = paras[0...max_paragraphs]
    arr.map! {|p| "<p>#{p}</p>"}
    val = arr.join(' ')
    val += '...' if paras.length > max_paragraphs
    val
  end
end
