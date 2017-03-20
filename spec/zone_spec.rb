require 'zone'
require 'spec_helper'

describe Zone do

  let(:x_max) { 10 }
  let(:y_max) { 10 }
  let(:zone) { Zone.new x_max, y_max }

  context 'updated rover position' do

    it 'successfully evaluates rovers position' do
      expect(zone.update(1, 1)).to be true
    end

    it 'successfully evaluates rovers position' do
      expect(zone.update(10, 10)).to be true
    end

    it 'evaluates rovers position as faulty' do
      expect { zone.update(0, 1) }.to raise_error(ArgumentError)
    end

    it 'successfully evaluates rovers position' do
      expect { zone.update(11, 1) }.to raise_error(ArgumentError)
    end

  end

end
