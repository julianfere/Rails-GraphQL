class GraphqlRailsSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # GraphQL-Ruby calls this when something goes wrong while running a query:
  def self.type_error(err, context)
    return if err.is_a?(GraphQL::InvalidNullError)

    super
  end
end
