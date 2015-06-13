require 'spec_helper'

describe Room do
  let(:room_top_room)             {build(:top_room)}
  let(:room_top_left_room)        {build(:top_left_room)}
  let(:room_top_right_room)       {build(:top_right_room)}

  let(:room_plain_room)           {build(:room)}
  let(:room_left_room)            {build(:left_room)}
  let(:room_right_room)           {build(:right_room)}

  let(:room_bottom_room)          {build(:bottom_room)}
  let(:room_bottom_left_room)     {build(:bottom_left_room)}
  let(:room_bottom_right_room)    {build(:bottom_right_room)}

  context 'when on the top row' do
    let(:room){room_top_room}

    it_behaves_like 'simple_room'
    it_behaves_like 'top_middle_room'

    context 'when on the left' do
      let(:room){room_top_left_room}

      it_behaves_like 'simple_room'
      it_behaves_like 'top_left_room'
    end

    context 'when on the right' do
      let(:room){room_top_right_room}

      it_behaves_like 'simple_room'
      it_behaves_like 'top_right_room'
    end
  end

  context 'when on a middle row' do
    let(:room){room_plain_room}

    it_behaves_like 'simple_room'

    context 'when on the left' do
      let(:room){room_left_room}

      it_behaves_like 'simple_room'
      it_behaves_like 'middle_left_room'
    end

    context 'when on the right' do
      let(:room){room_right_room}

      it_behaves_like 'simple_room'
      it_behaves_like 'middle_right_room'
    end
  end

  context 'when on the bottom row' do
    let(:room){room_bottom_room}

    it_behaves_like 'simple_room'
    it_behaves_like 'bottom_middle_room'

    context 'when on the left' do
      let(:room){room_bottom_left_room}

      it_behaves_like 'simple_room'
      it_behaves_like 'bottom_left_room'
    end

    context 'when on the right' do
      let(:room){room_bottom_right_room}

      it_behaves_like 'simple_room'
      it_behaves_like 'bottom_right_room'
    end
  end

end
