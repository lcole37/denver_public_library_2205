require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  describe 'Iteration 3' do
    before :each do
      @dpl = Library.new("Denver Public Library")
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @professor = @charlotte_bronte.write("The Professor", "1857")
      @villette = @charlotte_bronte.write("Villette", "1853")
      @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    end

    it 'exists' do
      expect(@dpl).to be_a(Library)
    end

    it 'has attributes' do
      expect(@dpl.name).to eq("Denver Public Library")
      expect(@dpl.books).to eq([])
      expect(@dpl.authors).to eq([])
    end

    it "can add authors and books to empty list" do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)

      expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
      expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
    end

    it "can tell publication time frame" do
      expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(@dpl.publication_time_frame_for(@harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end
end
