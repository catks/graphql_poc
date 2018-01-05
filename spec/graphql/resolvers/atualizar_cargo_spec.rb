require 'spec_helper'

RSpec.describe Resolvers::AtualizarCargo do
  let(:instance) { described_class.new }
  let(:args) do
    {
      id: cargo.id,
      titulo: 'teste2',
      descricao: 'teste2'
    }
  end

  let(:ctx) { {} }

  describe '#call' do
    subject { instance.call(nil, args, ctx ) }

    let!(:cargo) { Cargo.create(titulo: 'teste', descricao: 'teste') }

    it 'atualiza o titulo do cargo' do
      expect{ subject }.to change{ cargo.reload.titulo }.to('teste2')
    end

    it 'atualiza a descricao do cargo' do
      expect{ subject }.to change{ cargo.reload.descricao }.to('teste2')
    end
  end
end
