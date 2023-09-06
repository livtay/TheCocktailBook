import SwiftUI

@main
struct TheCocktailBookApp: App {
  var body: some Scene {
    WindowGroup {
      makeTabBar()
    }
  }
  
  private func makeTabBar() -> TabBar {
    let cocktailService = TCDBService.live
    let searchViewModel = CocktailSearchViewModel(cocktailService: cocktailService)
    let randomViewModel = RandomCocktailViewModel(cocktailService: cocktailService)
    return TabBar(
      searchViewModel: searchViewModel,
      randomViewModel: randomViewModel
    )
  }
}
