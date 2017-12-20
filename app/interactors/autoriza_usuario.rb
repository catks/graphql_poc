class AutorizaUsuario
  include Interactor

  def call
    context.fail!(error: 'auth.failure') if context.auth_token != '123456'
  end
end
