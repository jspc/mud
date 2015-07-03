require 'spec_helper'

describe Player do
  context 'when using a strong character' do
    let(:player){build(:player_high)}

    it_behaves_like 'simple_player'
  end

  context 'when using a mismatched character' do
    let(:player){build(:player_mismatched)}

    it_behaves_like 'simple_player'
  end

  context 'when using a weak character' do
    let(:player){build(:player)}

    it_behaves_like 'simple_player'
  end

end
