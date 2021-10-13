require "rails_helper"
require 'spec_helper'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

describe MoviesController do
    describe 'When the specified movie has a director' do
        it 'should call the model method that does director search' do
            Movie.should_receive(:find_directors).with('Guy Ritchie')
            get :directors, {:id => 1}
        end
        it 'should render the directors page' do 
            Movie.stub(:find_directors)
            get :directors, {:id => 1}
            response.should render_template('directors')
        end
    end
    
    describe 'WHen the specified movie does not have a director' do
        it 'should call the model method that does director search' do
            Movie.should_receive(:find_directors).with(nil)
            get :directors, {:id => 2}
        end
        it 'should render the home page' do 
            Movie.stub(:find_directors)
            get :directors, {:id => 2}
            response.should redirect_to('/movies')
        end
    end
end

