module DB
  module Cargo
    class Atualizar
      include Interactor

      def call
        cargo = ::Cargo.find(context.id)
        cargo.titulo = context.titulo
        cargo.descricao = context.descricao
        cargo.save!
        context.cargo = cargo
      end
    end
  end
end
