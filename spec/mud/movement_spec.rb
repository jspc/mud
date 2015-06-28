describe Movement do

  context "When running" do
    let(:movement){Parser.new.parse!('(run(go "left"))')}
    it '#running? returns true' do
      expect(movement.first.running?).to be true
    end
  end

  context "When not running" do
    let(:movement){Parser.new.parse!('(go "left")')}
    it '#running? returns true' do
      expect(movement.first.running?).to be false
    end
  end

end
