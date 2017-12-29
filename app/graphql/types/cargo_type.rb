Types::CargoType = GraphQL::ObjectType.define do
  name 'Cargo'

  field :id, !types.ID
  field :titulo, !types.String
  field :descricao, !types.String
  field :palavras_relacionadas, types[types.String] do
    complexity 1
    argument :limit, types.Int, default_value: 10

    resolve lambda { |_, args, _|
      palavras = %w[empolgante maneiro legal supimpa]
      Array.new(10) { palavras.sample }.take(args[:limit])
    }
  end

  field :formacoes, types[types.String] do
    complexity 1
    argument :limit, types.Int, default_value: 10

    resolve lambda { |obj, args, _|
      Rails.cache.fetch("cargo_formacoes_#{obj.id}", expires_in: 1.day ) do
        cursos = ['Analise de Sistemas', 'Administração', 'Psicologia', 'Medicina', 'Sociologia', 'Enfermagem']
        Array.new(3) { cursos.sample }.take(args[:limit])
      end
    }

  end
end
