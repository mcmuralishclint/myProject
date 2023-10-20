class Course < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # relationships
  belongs_to :category

  # validations
  validates :name, presence: true, uniqueness: true, uniqueness_across_models: true

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
    begin
      self.import
    rescue Elasticsearch::Transport::Transport::Errors::NotFound
      nil
    rescue => e
      nil
    end
  end
end
