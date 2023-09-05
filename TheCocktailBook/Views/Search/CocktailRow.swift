import SwiftUI

struct CocktailRow: View {
  
  var cocktail: Cocktail
  @State var ingredientsString = ""
  
  // MARK: - View
  
  var body: some View {
    VStack {
      HStack(alignment: .top, spacing: 16) {
        AsyncImage(
          url: URL(string: cocktail.imageUrl),
          content: { image in
            image
              .resizable()
              .scaledToFill()
              .frame(width: 100, height: 100)
              .clipped()
          }, placeholder: {
            Image(systemName: "wineglass")
              .renderingMode(.template)
              .resizable()
              .scaledToFit()
              .frame(width: 100, height: 100)
              .foregroundColor(Color(.systemGray3))
          }
        )
        VStack(alignment: .leading, spacing: 2) {
          Text(cocktail.name)
            .font(.title3.weight(.bold))
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(3)
          Text(cocktail.listedIngredients)
            .font(.callout)
            .foregroundColor(Color(.systemGray))
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(3)
          Spacer()
        }
        .multilineTextAlignment(.leading)
        Spacer()
      }
      .padding()
      .frame(height: 100)
      Divider()
        .padding(.leading)
    }
  }
  
}

struct CocktailRow_Previews: PreviewProvider {
  static var previews: some View {
    CocktailRow(
      cocktail: Cocktail(
        name: "Test Drink",
        imageUrl: "https://www.thecocktaildb.com/images/media/drink/vvpxwy1439907208.jpg",
        instructions: "Stir and pour over ice.",
        ingredient1: "Ingredient one",
        ingredient2: "Ingredient two",
        ingredient3: "Ingredient three",
        ingredient4: "Ingredient four",
        ingredient5: nil,
        ingredient6: nil,
        ingredient7: nil,
        ingredient8: nil,
        ingredient9: nil,
        ingredient10: nil,
        ingredient11: nil,
        ingredient12: nil,
        ingredient13: nil,
        ingredient14: nil,
        ingredient15: nil,
        measurement1: "1 cup",
        measurement2: "2 cups",
        measurement3: "3 oz",
        measurement4: "4 tbsp",
        measurement5: nil,
        measurement6: nil,
        measurement7: nil,
        measurement8: nil,
        measurement9: nil,
        measurement10: nil,
        measurement11: nil,
        measurement12: nil,
        measurement13: nil,
        measurement14: nil,
        measurement15: nil
      )
    )
  }
}
