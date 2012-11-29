# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require 'test/unit'

require 'abstract_controller'
require 'action_controller'
require 'action_dispatch'

require 'resources_id_replace'

class UsersController < ActionController::Base
  def show
    head params[:name] ? :ok : :not_found
  end
end
class CommentsController < ActionController::Base
  def index
    head params[:user_name] ? :ok : :not_found
  end
  def show
    head params[:user_name] && params[:id] ? :ok : :not_found
  end
end

class ResourcesIdReplaceTest < ActionDispatch::IntegrationTest
  Routes = ActionDispatch::Routing::RouteSet.new.tap do |app|
    app.draw do
      resources :users, :replace_id_with => 'name' do
        resources :comments
      end
    end
  end

  include Routes.url_helpers
  def app; Routes end

  test "accessing user by name instead of id" do
    get "/users/tkawa"
    assert_equal "200", @response.code
  end

  test "accessing subresource by name instead of id" do
    get "/users/tkawa/comments"
    assert_equal "200", @response.code
  end

  test "accessing member of subresource by id" do
    get "/users/tkawa/comments/1"
    assert_equal "200", @response.code
  end
end
