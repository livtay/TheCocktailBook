import SwiftUI

struct TabBar: View {
  
  var searchViewModel: CocktailSearchViewModel
  
  var body: some View {
    TabView {
      CocktailSearchView(viewModel: searchViewModel)
        .tabItem {
          Image(systemName: "wineglass")
          Text("Search")
        }
    }
  }
  
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar(
      searchViewModel: CocktailSearchViewModel(
        cocktailService: .live
      )
    )
  }
}
