Elasticsearch::Model.client = Elasticsearch::Client.new(log: true)
Rails.application.config.after_initialize do
  Vertical.__elasticsearch__.create_index! force: true
  Category.__elasticsearch__.create_index! force: true
  Course.__elasticsearch__.create_index! force: true
  Vertical.import force:true
  Category.import force:true
  Course.import force:true
end
