shared_examples 'simple_player' do
  it 'instantiates' do
    expect(player).not_to be_nil
  end

  [:add_item, :add_weapon, :cash, :items, :luck, :max_items, :reset,
   :running_speed, :speed, :strength, :weapons].each do |m|
    it "responds to #{m.to_s}" do
      expect(player).to respond_to(m)
    end
  end

  it "limits the amount of items allowed" do
    player.max_items.times {|x| player.add_item(Object.new)}
    expect(player.add_item(Object.new)).to be false
  end

  it "limits the amount of weapons allowed" do
    player.max_items.times {|x| player.add_weapon(Object.new)}
    expect(player.add_weapon(Object.new)).to be false
  end

  it "returns a numeric running speed" do
    player.max_items.times { player.add_weapon(Object.new)}
    expect(player.running_speed).to be_kind_of(Fixnum)
  end

end
