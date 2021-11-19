require 'binding_of_caller'
require 'rspec/core/example_group'

require_relative 'let_as/version'

module RSpec
  module LetAs
    class Error < StandardError; end

    refine Object do
      def let_as(name)
        example_group = binding.callers.lazy.map(&:receiver).find {|receiver|
          receiver.is_a?(Class) && receiver.ancestors.include?(RSpec::Core::ExampleGroup)
        }

        raise Error, <<~EOS unless example_group
          must be called from an example group or from within:

              RSpec.describe 'answer' do
                before do
                  42.let_as :answer
                end

                example do
                  expect(answer).to eq(42)
                end
              end
        EOS

        tap {|val|
          example_group.let(name) { val }
        }
      end
    end
  end
end
