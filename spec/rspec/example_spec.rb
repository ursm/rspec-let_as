using RSpec::LetAs

RSpec.describe 'let_as' do
  1.let_as :one

  before do
    2.let_as :two
  end

  let(:three) { 3.let_as(:three_2) }

  example do
    four_2 = 4.let_as(:four)

    expect(one).to     eq(1)
    expect(two).to     eq(2)
    expect(three).to   eq(3)
    expect(three_2).to eq(3)
    expect(four).to    eq(4)
    expect(four_2).to  eq(4)
  end
end
