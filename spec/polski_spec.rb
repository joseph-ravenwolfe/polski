require_relative '../lib/polski'

describe Polski do
  describe '.configure' do
    it 'can set the adapter' do
      Polski.configure do |config|
        config.adapter = Polski::Adapter::ConsoleAdapter
      end
      Polski::Configuration.adapter.should == Polski::Adapter::ConsoleAdapter
    end
  end
end
