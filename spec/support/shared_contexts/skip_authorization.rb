RSpec.shared_context 'skip_authorization' do
  before do
    allow_any_instance_of(ApplicationController).to receive(:authorize_request).and_return(true)
  end
end
