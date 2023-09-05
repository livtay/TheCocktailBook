import Foundation
import SwiftUI

struct Cocktail: Decodable, Equatable, Hashable, Identifiable {
  
  let id = UUID()
  let name: String
  let imageUrl: String
  let instructions: String
  let ingredient1: String
  let ingredient2: String?
  let ingredient3: String?
  let ingredient4: String?
  let ingredient5: String?
  let ingredient6: String?
  let ingredient7: String?
  let ingredient8: String?
  let ingredient9: String?
  let ingredient10: String?
  let ingredient11: String?
  let ingredient12: String?
  let ingredient13: String?
  let ingredient14: String?
  let ingredient15: String?
  let measurement1: String?
  let measurement2: String?
  let measurement3: String?
  let measurement4: String?
  let measurement5: String?
  let measurement6: String?
  let measurement7: String?
  let measurement8: String?
  let measurement9: String?
  let measurement10: String?
  let measurement11: String?
  let measurement12: String?
  let measurement13: String?
  let measurement14: String?
  let measurement15: String?
  
  enum CodingKeys: String, CodingKey {
    case name = "strDrink"
    case imageUrl = "strDrinkThumb"
    case instructions = "strInstructions"
    case ingredient1 = "strIngredient1"
    case ingredient2 = "strIngredient2"
    case ingredient3 = "strIngredient3"
    case ingredient4 = "strIngredient4"
    case ingredient5 = "strIngredient5"
    case ingredient6 = "strIngredient6"
    case ingredient7 = "strIngredient7"
    case ingredient8 = "strIngredient8"
    case ingredient9 = "strIngredient9"
    case ingredient10 = "strIngredient10"
    case ingredient11 = "strIngredient11"
    case ingredient12 = "strIngredient12"
    case ingredient13 = "strIngredient13"
    case ingredient14 = "strIngredient14"
    case ingredient15 = "strIngredient15"
    case measurement1 = "strMeasure1"
    case measurement2 = "strMeasure2"
    case measurement3 = "strMeasure3"
    case measurement4 = "strMeasure4"
    case measurement5 = "strMeasure5"
    case measurement6 = "strMeasure6"
    case measurement7 = "strMeasure7"
    case measurement8 = "strMeasure8"
    case measurement9 = "strMeasure9"
    case measurement10 = "strMeasure10"
    case measurement11 = "strMeasure11"
    case measurement12 = "strMeasure12"
    case measurement13 = "strMeasure13"
    case measurement14 = "strMeasure14"
    case measurement15 = "strMeasure15"
  }
  
  // Puts ingredients together into a list
  var listedIngredients: String {
    var string = ingredient1
    let ingredients = [ingredient2, ingredient3, ingredient4, ingredient5, ingredient6, ingredient7, ingredient8, ingredient9, ingredient10, ingredient11, ingredient12, ingredient13, ingredient14, ingredient15]
    for i in ingredients {
      if let i = i, !i.isEmpty {
        string = string + ", \(i)"
      }
    }
    return string
  }
  
  // Returns full recipe with ingredients and measurements
  var recipe: String {
    let measurement1 = removeTrailingWhitespace(measurement1)
    var string = "\(measurement1 ?? "") \(ingredient1)"
    let ingredients = [ingredient2, ingredient3, ingredient4, ingredient5, ingredient6, ingredient7, ingredient8, ingredient9, ingredient10, ingredient11, ingredient12, ingredient13, ingredient14, ingredient15]
    let measurements = [measurement2, measurement3, measurement4, measurement5, measurement6, measurement7, measurement8, measurement9, measurement10, measurement11, measurement12, measurement13, measurement14, measurement15]
    for (index, i) in ingredients.enumerated() {
      if let i = i, !i.isEmpty {
        if let measurement = removeTrailingWhitespace(measurements[index]) {
          string = string + "\n\(measurement) \(i)"
        } else {
          string = string + "\n\(i)"
        }
      }
    }
    return string
  }
  
  // Remove trailing whitespace to ensure single spacing between strings
  func removeTrailingWhitespace(_ string: String?) -> String? {
    guard var string = string else { return nil }
    if let lastChar = string.last, lastChar.isWhitespace {
      string.removeLast()
    }
    return string
  }
  
}
