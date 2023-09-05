import Foundation

struct CocktailsResponse: Decodable {
  
  let drinks: [Cocktail]
  
  enum CodingKeys: String, CodingKey {
    case drinks
  }
  
}
