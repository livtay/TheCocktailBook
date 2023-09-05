import SwiftUI

@main
struct TheCocktailBookApp: App {
  var body: some Scene {
    WindowGroup {
      makeSearchView()
    }
  }
  
  private func makeSearchView() -> CocktailSearchView {
    let cocktailService = TCDBService.live
    let viewModel = CocktailSearchViewModel(cocktailService: cocktailService)
    return CocktailSearchView(viewModel: viewModel)
  }
}
