import SwiftUI

struct CocktailSearchView: View {
  
  @ObservedObject var viewModel: CocktailSearchViewModel
  
  // MARK: - View
  
  var body: some View {
    NavigationStack {
      cocktailSearchView
        .searchable(text: $viewModel.searchText)
        .navigationTitle("Cocktail Search")
    }
  }
  
  @ViewBuilder private var cocktailSearchView: some View {
    switch viewModel.state {
    case .noResults:
      Text("No results")
    case .error(let error):
      Text(error.localizedDescription)
    case .success(let cocktails):
      ScrollView {
        VStack {
          ForEach(cocktails) { cocktail in
            NavigationLink {
              CocktailDetailsView(cocktail: cocktail)
                .navigationBarTitleDisplayMode(.inline)
            } label: {
              CocktailRow(cocktail: cocktail)
            }
            .buttonStyle(PlainButtonStyle())
          }
        }
      }
      .scrollDismissesKeyboard(.immediately)
    }
  }
}

struct CocktailSearchView_Previews: PreviewProvider {
  static var previews: some View {
    CocktailSearchView(
      viewModel: CocktailSearchViewModel(
        cocktailService: .live
      )
    )
  }
}
