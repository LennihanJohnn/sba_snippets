class Snippet < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  searchkick

  belongs_to :user
  belongs_to :language
  has_many :comments, -> { order(updated_at: :desc) }

  validates_presence_of :user, :language, :title, :code

  scope :latest, -> { order(updated_at: :desc) }

  delegate :name, to: :language, prefix: true

  scope :search_import, -> { includes(:language) }

  def search_data
    {
      title: title,
      language: language_name
    }
  end
end
