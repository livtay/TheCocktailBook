import SwiftUI

struct RecipeInstructionsView: View {
  
  var instructions: String
  
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
        Text("Instructions:")
          .font(.title2.weight(.bold))
        Text(instructions)
          .font(.title2.weight(.regular))
      }
      .padding()
    }
    .fixedSize(horizontal: false, vertical: true)
    .padding([.horizontal, .top])
  }
  
}

struct RecipeInstructionsView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeInstructionsView(instructions: "Pour the Galliano liqueur over ice. Fill the remainder of the glass with ginger ale and thats all there is to it. You now have a your very own GG.")
  }
}
