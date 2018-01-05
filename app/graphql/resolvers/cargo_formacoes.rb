class Resolvers::CargoFormacoes < GraphQL::Function
  complexity 1
  argument :limit, types.Int, default_value: 10

  type Types::CargoType

  def call(obj, args, _ctx)
    Rails.cache.fetch("cargo_formacoes_#{obj.id}", expires_in: 1.day ) do
      cursos = ['Analise de Sistemas', 'Administração', 'Psicologia', 'Medicina', 'Sociologia', 'Enfermagem']
      Array.new(3) { cursos.sample }.take(args[:limit])
    end
  end
end
