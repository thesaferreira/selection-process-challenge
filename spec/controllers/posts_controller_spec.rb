require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    it { should use_before_action(:authenticate_user!) }
    it { should use_before_action(:set_post) }

    it { should route(:get, '/').to(action: :index) }
    it { should route(:get, '/posts/1').to(action: :show, id: 1) }

    describe "GET index" do
        before { get :index }
        it { should respond_with(200) }
    end
end