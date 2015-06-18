require 'spec_helper'

describe Server do
  let(:mud_server){build(:server)}
  let(:log){mud_server.log('oh noes!')}

  before(:each) do
    Celluloid.boot
    $stderr.stub(:write)
    time = Time.parse("2015-06-18 13:48:43 +0100")
    Time.stub(:now){time}
  end

  after(:each) do
    Celluloid.shutdown
  end

  [:height=, :port=, :threads=, :width=,
   :run, :play, :log, :handle_connection, :finalize].each do |m|
    it "reponds to #{m.to_s}" do
      expect(mud_server).to respond_to(m)
    end

    it 'logs messages' do
      expect{log}.to output("2015-06-18 13:48:43 +0100 - oh noes!\n").to_stdout
    end
  end
end
