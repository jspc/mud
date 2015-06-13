require 'spec_helper'

describe Graph do
  let(:graph_small_graph) {build(:small_graph)}

  context 'when creating a pretty small graph' do
    let(:graph){graph_small_graph}
    let(:graph_data) {graph.graph}

    it_behaves_like 'simple_graph'

    context 'first row' do
      let(:row) {graph_data.first}

      describe 'top left room' do
        let(:room){row.first}

        it_behaves_like 'top_left_room'
        it_behaves_like 'traversible_down'
        it_behaves_like 'traversible_right'
        it_behaves_like 'not_traversible_up'
        it_behaves_like 'not_traversible_left'
      end

      describe 'top right room' do
        let(:room){row.last}

        it_behaves_like 'top_right_room'
        it_behaves_like 'traversible_down'
        it_behaves_like 'traversible_left'
        it_behaves_like 'not_traversible_up'
        it_behaves_like 'not_traversible_right'
      end
    end

    context 'bottom row' do
      let(:row) {graph_data.last}

      describe 'bottom left room' do
        let(:room){row.first}

        it_behaves_like 'bottom_left_room'
        it_behaves_like 'traversible_up'
        it_behaves_like 'traversible_right'
        it_behaves_like 'not_traversible_down'
        it_behaves_like 'not_traversible_left'
      end

      describe 'bottom right room' do
        let(:room){row.last}

        it_behaves_like 'bottom_right_room'
        it_behaves_like 'traversible_up'
        it_behaves_like 'traversible_left'
        it_behaves_like 'not_traversible_down'
        it_behaves_like 'not_traversible_right'
      end

    end
  end
end
