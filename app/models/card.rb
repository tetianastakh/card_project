require 'elasticsearch/model'

class Card < ActiveRecord::Base
	acts_as_paranoid

	has_attached_file :card_photo, styles: { medium: "300x300>", thumb: "100x100>" }, :default_url => ''
  validates_attachment_content_type :card_photo, content_type: /\Aimage\/.*\z/

  has_many :fields

  accepts_nested_attributes_for :fields, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
  
  include Elasticsearch::Model

	def as_indexed_json(options={})
    as_json(
      only: [:id, :firstname, :lastname, :attachment],
      include: [:fields],
      methods: [:card_photo]
    )
  end
end
