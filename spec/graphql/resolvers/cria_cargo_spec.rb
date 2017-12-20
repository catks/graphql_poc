require 'spec_helper'

RSpec.describe Resolvers::CriaCargo do
  let(:instance) { described_class.new }
  let(:args) do
    {
      titulo: 'Analista Testador',
      descricao: 'Esse cargo é legal'
    }
  end

  describe '#call' do
    it 'cria um cargo' do
      cargo = instance.call(nil, args, {} )
      expect(cargo).to be_persisted
    end

    it 'seta o titulo' do
      cargo = instance.call(nil, args, {} )
      expect(cargo.titulo).to eq(args[:titulo])
    end

    it 'seta a descrição' do
      cargo = instance.call(nil, args, {} )
      expect(cargo.descricao).to eq(args[:descricao])
    end
  end
end
