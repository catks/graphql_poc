class ApagarCargo
  include Interactor::Organizer

  organize AutenticarUsuario, DB::Cargo::Deletar
end
