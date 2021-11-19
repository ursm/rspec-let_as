using RSpec::LetAs

RSpec.describe 'let_as' do
  1.let_as :one

  before do
    2.let_as :two
  end

  let!(:_three) { 3.let_as(:three) }

  def let_four
    4.let_as :four
  end

  example do
    let_four
    5.let_as :five

    expect(one).to   eq(1)
    expect(two).to   eq(2)
    expect(three).to eq(3)
    expect(four).to  eq(4)
    expect(five).to  eq(5)
  end
end
