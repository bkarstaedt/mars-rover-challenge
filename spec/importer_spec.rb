require 'importer'
require 'spec_helper'

describe Importer do

  let(:importer) { Importer.new commands }

  context 'valid data set' do

    let(:commands) do
      %(
        4 4
        3 2 S
        MMLMR
      )
    end

    it 'imports successfully' do
      expect(importer.x_max).to eq(4)
      expect(importer.y_max).to eq(4)
      expect(importer.start_vector).to eq(
        x: 3, y: 2, direction: :south
      )
      expect(importer.commands).to eq(
        [:move, :move, :rotate_left, :move, :rotate_right]
      )
    end

  end

  context 'defect data set' do

    context 'unusal lines' do
      let(:commands) do
        %(
          1 1
          3 2 S
          #####
          M
        )
      end
      it 'imports a general data set' do
        expect { Importer.new(commands) }.to raise_error(ArgumentError)
      end
    end

    context 'invalid line 2 (too many arguments)' do
      let(:commands) do
        %(
          1 1
          3 2 S N
          M
        )
      end
      it 'imports a general data set' do
        expect { Importer.new(commands) }.to raise_error(ArgumentError)
      end
    end

    context 'invalid line 3 (invalid command)' do
      let(:commands) do
        %(
          1 1
          3 2 S
          MXM
        )
      end
      it 'imports a general data set' do
        expect { Importer.new(commands) }.to raise_error(ArgumentError)
      end
    end

  end

end
