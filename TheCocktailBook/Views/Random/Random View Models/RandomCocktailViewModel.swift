import Foundation

final class RandomCocktailViewModel: ObservableObject {
  
  // States of view model to alter the UI
  enum RandomCocktailState {
    case loading
    case success(_ cocktail: Cocktail)
    case error(_ error: Error)
  }
  
  let cocktailService: TCDBService
  
  // MARK: - Private Properties
  
  @Published private(set) var state: RandomCocktailState = .loading
  
  // MARK: - Initializer
  
  init(cocktailService: TCDBService) {
    self.cocktailService = cocktailService
    reload()
  }
  
  func reload() {
    Task {
      await loadRandomCocktail()
    }
  }
  
}

// MARK: - Private Functions

private extension RandomCocktailViewModel {
  
  func loadRandomCocktail() async {
    do {
      let cocktailsList = try await cocktailService.getRandomCocktail()
      DispatchQueue.main.async {
        if let cocktail = cocktailsList?.drinks.first {
          self.state = .success(cocktail)
        } else {
          self.state = .error(TCDBError.decoding)
        }
      }
    } catch let error {
      // Handle the error in the UI by setting the state
      DispatchQueue.main.async {
        self.state = .error(error)
      }
    }
  }
  
}
