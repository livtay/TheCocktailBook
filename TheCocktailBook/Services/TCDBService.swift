import Foundation

struct TCDBService {
  
  let getCocktailsList: (String) async throws -> CocktailsResponse?
  
}

extension TCDBService {
  
  // Live environment for production
  static var live: TCDBService {
    TCDBService(
      getCocktailsList: { query in
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "thecocktaildb.com"
        urlComponents.path = "/api/json/v1/1/search.php"
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "s", value: query)
        ]
        urlComponents.queryItems = queryItems
        if let url = urlComponents.url {
          let (data, _) = try await URLSession.shared.data(from: url)
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          do {
            let cocktails = try decoder.decode(CocktailsResponse.self, from: data)
            return cocktails
          } catch let error {
            // TODO: handle nil response here
            print(error)
            throw TCDBError.decoding
          }
        } else {
          throw TCDBError.badUrl
        }
      }
    )
  }
  
}

enum TCDBError: Error {
  case badUrl
  case decoding
}
