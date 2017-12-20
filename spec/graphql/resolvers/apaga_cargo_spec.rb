require 'spec_helper'

RSpec.describe Resolvers::ApagaCargo do
  let(:instance) { described_class.new }
  let(:args) do
    {
      id: Cargo.first.id
    }
  end

  let(:ctx) { {} }

  describe '#call' do
    subject { instance.call(nil, args, ctx ) }
    before { Cargo.create(titulo: 'teste', descricao: 'teste') }

    context 'com authorização' do
      let(:ctx) { { auth_token: '123456' } }

      it 'deleta um cargo' do
        expect{ subject }.to change{ Cargo.count }.by(-1)
      end
    end

    context 'sem autorização' do
      it 'não deleta um cargo' do
        expect{ subject }.to_not change{ Cargo.count }
      end
    end
  end
end
