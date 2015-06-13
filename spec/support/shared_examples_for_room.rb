shared_examples 'simple_room' do
  it 'instantiates' do
    expect(room).not_to be_nil
  end

  [:is_top?, :is_bottom?, :is_left?, :is_right?, :coords].each do |bool|
    it "responds to #{bool.to_s}" do
      expect(room).to respond_to(bool)
    end
  end

  [:top, :bottom, :left, :right].each do |setter|
    it "doesn't respond to setter method #{setter.to_s}" do
      expect(room).not_to respond_to(setter)
    end
  end

end

shared_examples 'top_left_room' do
  it 'knows it is on the top row and the left' do
    expect(room.is_top?).to be true
    expect(room.is_bottom?).to be false
    expect(room.is_left?).to be true
    expect(room.is_right?).to be false
  end
end

shared_examples 'top_right_room' do
  it 'knows it is on the top row and the right' do
    expect(room.is_top?).to be true
    expect(room.is_bottom?).to be false
    expect(room.is_left?).to be false
    expect(room.is_right?).to be true
  end
end

shared_examples 'middle_left_room' do
  it 'knows it is on a middle row and the left' do
    expect(room.is_top?).to be false
    expect(room.is_bottom?).to be false
    expect(room.is_left?).to be true
    expect(room.is_right?).to be false
  end
end

shared_examples 'middle_right_room' do
  it 'knows it is on a middle row and the right' do
    expect(room.is_top?).to be false
    expect(room.is_bottom?).to be false
    expect(room.is_left?).to be false
    expect(room.is_right?).to be true
  end
end

shared_examples 'bottom_left_room' do
  it 'knows it is on the bottom row and the left' do
    expect(room.is_top?).to be false
    expect(room.is_bottom?).to be true
    expect(room.is_left?).to be true
    expect(room.is_right?).to be false
  end
end

shared_examples 'bottom_right_room' do
  it 'knows it is on the bottom row and the right' do
    expect(room.is_top?).to be false
    expect(room.is_bottom?).to be true
    expect(room.is_left?).to be false
    expect(room.is_right?).to be true
  end
end

shared_examples 'bottom_middle_room' do
  it 'knows its on the bottom row' do
    expect(room.is_top?).to be false
    expect(room.is_bottom?).to be true
    expect(room.is_left?).to be false
    expect(room.is_right?).to be false
  end
end

shared_examples 'top_middle_room' do
  it 'knows its on the top row' do
    expect(room.is_top?).to be true
    expect(room.is_bottom?).to be false
    expect(room.is_left?).to be false
    expect(room.is_right?).to be false
  end
end
