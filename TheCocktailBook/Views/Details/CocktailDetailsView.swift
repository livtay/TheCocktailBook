import SwiftUI

struct CocktailDetailsView: View {
  
  var cocktail: Cocktail
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        AsyncImage(
          url: URL(string: cocktail.imageUrl),
          content: { image in
            image
              .resizable()
              .scaledToFit()
              .clipped()
          }, placeholder: {
            Image(systemName: "wineglass")
              .renderingMode(.template)
              .resizable()
              .scaledToFit()
              .frame(width: 75, height: 100)
              .foregroundColor(Color(.systemGray3))
          }
        )
        ZStack(alignment: .leading) {
          Color.clear
            .opacity(0.10)
            .cornerRadius(16)
            .overlay(
              RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 1)
                .opacity(0.50)
            )
          VStack(alignment: .leading, spacing: 8) {
            Text("Recipe:")
              .font(.title2.weight(.bold))
            Text(cocktail.recipe)
              .font(.title2.weight(.regular))
          }
          .padding()
        }
        .padding()
        ZStack(alignment: .leading) {
          Color.clear
            .opacity(0.10)
            .cornerRadius(16)
            .overlay(
              RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 1)
                .opacity(0.50)
            )
          VStack(alignment: .leading, spacing: 8) {
            Text("Instructions:")
              .font(.title2.weight(.bold))
            Text(cocktail.instructions)
              .font(.title2.weight(.regular))
          }
          .padding()
        }
        .padding(.horizontal)
        Spacer()
      }
    }
    .navigationTitle(cocktail.name)
  }
  
}

struct CocktailDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      CocktailDetailsView(
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
}
