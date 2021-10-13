require "rails_helper"
require 'spec_helper'

describe Movie do
    describe 'movies with the same director' do
        it 'should contain movies with steven spielberg if Raiders of the Lost Ark is chosen' do
            movies = Movie.find_directors("Steven Spielberg")
            rola = Movie.where(:title => "Raiders of the Lost Ark")
            jaws = Movie.where(:title => "Jaws")
            expect(movies).to include(rola[0])
            expect(movies).to include(jaws[0])
            #expect(movies).to include(:title => "Raiders of the Lost Ark")
        end
    end
    describe 'movies with different directors' do
        it 'should not contain moives with steve spielberg if Raiders of the lost Ark is chosen' do
            movies = Movie.find_directors("Steven Spielberg")
            rola = Movie.where(:title => "Raiders of the Lost Ark")
            alladin = Movie.where(:title => "Alladin")
            expect(movies).to include(rola[0])
            expect(movies).not_to include(alladin[0])
        end
    end
end