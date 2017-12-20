module DB
  module Cargo
    class Deletar
      include Interactor

      def call
        cargo = ::Cargo.find(context.id)
        cargo.destroy
        context.cargo = cargo
      end
    end
  end
end
