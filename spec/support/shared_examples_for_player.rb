shared_examples 'simple_player' do
  it 'instantiates' do
    expect(player).not_to be_nil
  end

  [:add_item, :add_weapon, :cash, :health, :items, :luck,
   :max_items, :reset,:running_speed, :speed, :strength, :weapons].each do |m|
    it "responds to #{m.to_s}" do
      expect(player).to respond_to(m)
    end
  end

  it "adds weapons" do
    player.add_weapon(Object.new)
    expect(player.weapons.size).to be 1
  end

  it "adds items" do
    player.add_item(Object.new)
    expect(player.items.size).to be 1
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


  context "when calling #reset" do
    before(:each) do
      player.add_weapon(Object.new)
      player.add_item(Object.new)
      player.health = 0
    end

    it "restores a player's health" do
      player.reset
      expect(player.health).to be 100
    end

    it "removes a player's weapons" do
      player.reset
      expect(player.weapons.size).to be 0
    end

    it "removes a player's items" do
      player.reset
      expect(player.items.size).to be 0
    end
  end

end
