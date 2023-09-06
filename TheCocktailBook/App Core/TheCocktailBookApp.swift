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
    let viewModel = CocktailSearchViewModel(cocktailService: cocktailService)
    return TabBar(searchViewModel: viewModel)
  }
}
