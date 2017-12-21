module DB
  module Cargo
    class Deletar
      include Interactor

      def call
        ::Cargo.destroy(context.id)
      end
    end
  end
end
