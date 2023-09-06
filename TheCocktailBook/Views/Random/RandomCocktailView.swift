import SwiftUI

struct RandomCocktailView: View {
  
  @ObservedObject var viewModel: RandomCocktailViewModel
  @State var cocktail: Cocktail?
  
  // MARK: - View
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          Button("Get Random Cocktail") {
            viewModel.reload()
          }
          randomCocktailView
        }
      }
      .navigationTitle("Random Cocktail")
    }
  }
  
  @ViewBuilder private var randomCocktailView: some View {
    switch viewModel.state {
    case .loading:
      Text("Loading...")
    case .error(let error):
      Text(error.localizedDescription)
    case .success(let cocktail):
      VStack(alignment: .leading) {
        DetailImageView(imageUrl: cocktail.imageUrl)
        RecipeListView(recipe: cocktail.recipe)
        RecipeInstructionsView(instructions: cocktail.instructions)
          .navigationTitle(cocktail.name)
        Spacer()
      }
    }
  }
  
}

struct RandomCocktailView_Previews: PreviewProvider {
  static var previews: some View {
    RandomCocktailView(viewModel: RandomCocktailViewModel(cocktailService: .live))
  }
}
