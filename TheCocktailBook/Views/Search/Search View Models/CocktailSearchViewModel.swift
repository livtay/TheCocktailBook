import Combine
import Foundation

final class CocktailSearchViewModel: ObservableObject {
  
  // States of view model to alter the UI
  enum CocktailSearchState {
    case noResults
    case success(_ cocktails: [Cocktail])
    case error(_ error: Error)
  }
  
  let cocktailService: TCDBService
  @Published var searchText = ""
  
  // MARK: - Private Properties
  
  @Published private(set) var state: CocktailSearchState = .noResults
  private var cancellables = Set<AnyCancellable>()
  
  // MARK: - Initializer
  
  init(cocktailService: TCDBService) {
    self.cocktailService = cocktailService
    debounceTextChanges()
    Task {
      await loadCocktails()
    }
  }
  
}

// MARK: - Private Functions

private extension CocktailSearchViewModel {
  
  // Combine debounce while user types to limit API calls and improve app speed and performance
  func debounceTextChanges() {
    $searchText
      .dropFirst()
      .debounce(for: 0.2, scheduler: DispatchQueue.main)
      .sink { value in
        Task {
          await self.loadCocktails()
        }
      }
      .store(in: &cancellables)
  }
  
  func loadCocktails() async {
    do {
      let cocktailList = try await cocktailService.getCocktailsList(searchText)
      DispatchQueue.main.async {
        let cocktails = cocktailList?.drinks ?? []
        self.state = cocktails.isEmpty ? .noResults : .success(cocktails)
      }
    } catch let error {
      // Handle the error in the UI by setting the state
      DispatchQueue.main.async {
        self.state = .error(error)
      }
    }
  }
  
}
