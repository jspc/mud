shared_examples 'simple_graph' do
  it 'instantiates' do
    expect(graph).not_to be_nil
  end

  [:graph, :traverse].each do |m|
    it "responds to #{m.to_s}" do
      expect(graph).to respond_to(m)
    end
  end

end

shared_examples 'traversible_up' do
  let(:new_room)    {graph.traverse(room, :up)}
  let(:old_coords)  {room.coords}

  it 'traverses upward' do
    expect(new_room).not_to be false
    expect(new_room.coords[:x]).to eql(old_coords[:x])
    expect(new_room.coords[:y]).to eql(old_coords[:y] - 1)
  end
end

shared_examples 'traversible_down' do
  let(:new_room)    {graph.traverse(room, :down)}
  let(:old_coords)  {room.coords}

  it 'traverses downward' do
    expect(new_room).not_to be false
    expect(new_room.coords[:x]).to eql(old_coords[:x])
    expect(new_room.coords[:y]).to eql(old_coords[:y] + 1)
  end
end

shared_examples 'traversible_left' do
  let(:new_room)    {graph.traverse(room, :left)}
  let(:old_coords)  {room.coords}

  it 'traverses leftward' do
    expect(new_room).not_to be false
    expect(new_room.coords[:x]).to eql(old_coords[:x] - 1)
    expect(new_room.coords[:y]).to eql(old_coords[:y])
  end
end

shared_examples 'traversible_right' do
  let(:new_room)    {graph.traverse(room, :right)}
  let(:old_coords)  {room.coords}

  it 'traverses rightward' do
    expect(new_room).not_to be false
    expect(new_room.coords[:x]).to eql(old_coords[:x] + 1)
    expect(new_room.coords[:y]).to eql(old_coords[:y])
  end
end

shared_examples 'not_traversible_up' do
  it "doesn't traverse upward" do
    expect(graph.traverse(room, :up)).to be false
  end
end

shared_examples 'not_traversible_down' do
  it "doesn't traverse downward" do
    expect(graph.traverse(room, :down)).to be false
  end
end

shared_examples 'not_traversible_left' do
  it "doesn't traverse leftward" do
    expect(graph.traverse(room, :left)).to be false
  end
end

shared_examples 'not_traversible_right' do
  it "doesn't traverse rightward" do
    expect(graph.traverse(room, :right)).to be false
  end
end
