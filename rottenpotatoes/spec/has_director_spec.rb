require "rails_helper"

describe MoviesController do
    describe 'When the specified movie has a director' do
        it 'should call the model method that does director search' do
            Movie.should_receive(:find_directors).with('joe Schmoe')
            gets :id, {:id => 5}
        end
    end
end

