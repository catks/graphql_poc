require 'spec_helper'

RSpec.describe Resolvers::BuscarCargo do
  let(:instance) { described_class.new }
  let(:args) do
    {
      id: Cargo.first.id
    }
  end

  describe '#call' do
    before { Cargo.create(titulo: 'teste', descricao: 'teste') }

    it 'retorna o cargo especificado' do
      cargo = instance.call(nil, args, {} )

      expect(cargo.id).to eq(args[:id])
    end
  end
end
