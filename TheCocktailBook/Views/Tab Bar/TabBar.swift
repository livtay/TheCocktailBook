import SwiftUI

struct TabBar: View {
  
  var searchViewModel: CocktailSearchViewModel
  var randomViewModel: RandomCocktailViewModel
  
  var body: some View {
    TabView {
      CocktailSearchView(viewModel: searchViewModel)
        .tabItem {
          Image(systemName: "wineglass")
          Text("Search")
        }
      RandomCocktailView(viewModel: randomViewModel)
        .tabItem {
          Image(systemName: "dice")
          Text("Random")
        }
    }
  }
  
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar(
      searchViewModel: CocktailSearchViewModel(
        cocktailService: .live
      ),
      randomViewModel: RandomCocktailViewModel(
        cocktailService: .live
      )
    )
  }
}
