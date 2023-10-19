class Course < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :category
  enum state: { active: 1, inactive: 0 }

  validates :name, uniqueness_across_models: true

  after_commit :index_document, on: [:create, :update]

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
