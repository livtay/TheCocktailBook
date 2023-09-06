import SwiftUI

struct RecipeListView: View {
  
  var recipe: String
  
  var body: some View {
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
        Text(recipe)
          .font(.title2.weight(.regular))
      }
      .padding()
    }
    .fixedSize(horizontal: false, vertical: true)
    .padding([.horizontal, .top])
  }
  
}

struct RecipeListView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeListView(recipe: "1 1/2 oz Tequila\n1/2 oz Triple sec\n1 oz Lime juice\nSalt")
  }
}
