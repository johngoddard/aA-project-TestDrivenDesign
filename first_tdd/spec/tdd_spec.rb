require 'rspec'
require 'tdd'

describe "#dups" do
  let(:arr) {[1,1,2,3,3]}

  it "should return an array with no duplicates" do
    expect(dups(arr)).to eq([1,2,3])
  end

  before(:each) do
    dups(arr)
  end

  it "does not modify the original array" do
    expect(arr).to eq(arr)
  end

  it "returns an empty array given an empty array"
end

describe "#two_sum" do
  let(:arr) {[-1,0,1]}
  let(:arr2) {[-1,0,2,-2,1]}
  let(:arr3){[1,2,3,4]}

  it "returns pairs that sum to zero" do
    expect(two_sum(arr)).to eq([[0,2]] )
    # expect([[[0,2]],[[2,0]]].include?(two_sum(arr))).to be_truthy
  end
# sorting stuff
  it "returns two sum pairs in order" do
    expect(two_sum(arr2)).to eq(two_sum(arr2).sort )
  end

  it "returns empty array if no zero sums" do
    expect(two_sum(arr3)).to eq([])
  end

end

describe "#my_transpose" do
  let(:rows) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  let(:rows2) {[
    [0, 1, 2, 9],
    [3, 4, 5, 10],
    [6, 7, 8, 11]
  ]}

  it "returns an array with the same number of elements as rows" do
    expect(my_transpose(rows).flatten.size).to eq(rows.flatten.size)
  end

  #dimensionality
  it "returns an array with the right number of rows" do
    expect(my_transpose(rows2).size).to eq(rows2[0].size)
  end

  it "returns an array with the right number of columns" do
    expect(my_transpose(rows2)[0].size).to eq(rows2.size)
  end

  #correctness
  it "returns a correctly transposed array" do
    expect(my_transpose(rows)).to eq(rows.transpose)
  end
end


describe "stock_picker" do
  let(:desc) {[10,9,8]}
  it "if stocks are descending return empty array" do
    expect(stock_picker(desc)).to eq([])
  end

  let(:ascen) {[13, 8, 11]}
  it "returns a sell date that's after the buy date" do
    answer = stock_picker(ascen)
    expect(answer[1] > answer[0]).to be_truthy
    # expect(answer[1]).to > answer[0]
  end

  let(:final) {[13, 8, 11, 10, 12]}
  it "stock picker picks 2 indices that gives you the most money" do
    expect(stock_picker(final)).to eq([1,4])
  end
end
