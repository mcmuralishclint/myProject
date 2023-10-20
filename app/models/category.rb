class Category < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # relationships
  belongs_to :vertical
  has_many :courses, dependent: :destroy
  accepts_nested_attributes_for :courses

  # validations
  validates :name, uniqueness_across_models: true

  # post hooks
  after_commit :index_document, on: [:create, :update]

  enum state: { active: 1, inactive: 0 }

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
    end
  end

  private

  def index_document
    self.import rescue nil
  end
end
