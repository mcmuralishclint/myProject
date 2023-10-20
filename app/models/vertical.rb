class Vertical < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # relationships
  has_many :categories, dependent: :destroy
  accepts_nested_attributes_for :categories

  # validations
  validates :name, presence: true, uniqueness: true, uniqueness_across_models: true


  # post hooks
  after_commit :index_document, on: [:create, :update]

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
