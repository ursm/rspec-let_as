RSpec.describe RSpec::LetAs do
  using RSpec::LetAs

  describe 'via method' do
    def let_foo
      'foo'.let_as :foo
    end

    example do
      let_foo

      expect(foo).to eq('foo')
    end
  end
end
