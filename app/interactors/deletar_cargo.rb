class DeletarCargo
  include Interactor

  def call
    cargo = Cargo.find(context.id)
    cargo.destroy
    context.cargo = cargo
  end
end
