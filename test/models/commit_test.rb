require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Commit Model" do
  it 'can construct a new instance' do
    @commit = Commit.new
    refute_nil @commit
  end
end
