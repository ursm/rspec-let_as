# RSpec::LetAs

Right assignment extension for RSpec

``` ruby
using RSpec::LetAs

RSpec.describe 'answer' do
  before do
    42.let_as :answer
  end

  example do
    expect(answer).to eq(42)
  end
end
```

## Motivation

When testing a Rails application with RSpec, I am often faced with the need to arrange large object graph. And since I also need to be able to access specific nodes in the graph, I have to create edges one by one.

``` ruby
RSpec.describe MyApp do
  let(:user)      { create(:user) }
  let(:post)      { create(:post, user: user) }
  let(:comment_1) { create(:comment, post: post) }
  let(:comment_2) { create(:comment, post: post) }

  # ...
end
```

It is often difficult to imagine the resulting graph from such code. So RSpec::LetAs makes it possible to export the necessary references while building the graph hierarchically.

``` ruby
using RSpec::LetAs

RSpec.describe MyApp do
  before do
    create(:user, posts: [
      build(:post, comments: [
        build(:comment).let_as(:comment_1),
        build(:comment).let_as(:comment_2)
      ]).let_as(:post)
    ]).let_as(:user)
  end

  # ...
end
```

## Usage

It is implemented as a refinement and should be passed as an argument to `Module#using`.

``` ruby
using RSpec::LetAs
```

Then `Object#let_as` will be defined in the scope of the file or class. It can be used in example group (`describe` / `context`) or example (`example` / `it` / `before` / `let` / etc.).

``` ruby
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
```

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'rspec-let_as'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rspec-let_as

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
