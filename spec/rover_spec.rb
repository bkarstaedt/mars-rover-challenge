require 'rover'
require 'spec_helper'

describe Rover do

  let(:rover) { Rover.new start_vector }

  context 'moving' do
    before(:each) do
      rover.execute_command :move
    end

    context 'north' do
      let(:start_vector) { { x: 2, y: 2, direction: :north } }
      it 'moves one up' do
        expect(rover.x).to eq(2)
        expect(rover.y).to eq(3)
      end
    end

    context 'east' do
      let(:start_vector) { { x: 2, y: 2, direction: :east } }
      it 'moves one right' do
        expect(rover.x).to eq(3)
        expect(rover.y).to eq(2)
      end
    end

    context 'south' do
      let(:start_vector) { { x: 2, y: 2, direction: :south } }
      it 'moves one down' do
        expect(rover.x).to eq(2)
        expect(rover.y).to eq(1)
      end
    end

    context 'west' do
      let(:start_vector) { { x: 2, y: 2, direction: :west } }
      it 'moves one left' do
        expect(rover.x).to eq(1)
        expect(rover.y).to eq(2)
      end
    end
  end

  context 'rotating left' do
    before(:each) do
      rover.execute_command :rotate_left
    end

    context 'direction north' do
      let(:start_vector) { { x: 1, y: 1, direction: :north } }
      it { expect(rover.direction).to eq(:west) }
    end

    context 'direction east' do
      let(:start_vector) { { x: 1, y: 1, direction: :east } }
      it { expect(rover.direction).to eq(:north) }
    end

    context 'direction south' do
      let(:start_vector) { { x: 1, y: 1, direction: :south } }
      it { expect(rover.direction).to eq(:east) }
    end

    context 'direction west' do
      let(:start_vector) { { x: 1, y: 1, direction: :west } }
      it { expect(rover.direction).to eq(:south) }
    end
  end

  context 'rotating right' do
    before(:each) do
      rover.execute_command :rotate_right
    end

    context 'direction north' do
      let(:start_vector) { { x: 1, y: 1, direction: :north } }
      it { expect(rover.direction).to eq(:east) }
    end

    context 'direction east' do
      let(:start_vector) { { x: 1, y: 1, direction: :east } }
      it { expect(rover.direction).to eq(:south) }
    end

    context 'direction south' do
      let(:start_vector) { { x: 1, y: 1, direction: :south } }
      it { expect(rover.direction).to eq(:west) }
    end

    context 'direction west' do
      let(:start_vector) { { x: 1, y: 1, direction: :west } }
      it { expect(rover.direction).to eq(:north) }
    end
  end

end
