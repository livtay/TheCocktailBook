import SwiftUI

struct DetailImageView: View {
  
  let imageUrl: String
  
  var body: some View {
    AsyncImage(
      url: URL(string: imageUrl),
      content: { image in
        image
          .resizable()
          .scaledToFit()
          .clipped()
      }, placeholder: {
        Image(systemName: "wineglass")
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(width: 75, height: 100)
          .foregroundColor(Color(.systemGray3))
      }
    )
  }
  
}

struct DetailImageView_Previews: PreviewProvider {
  static var previews: some View {
    DetailImageView(imageUrl: "https://www.thecocktaildb.com/images/media/drink/vvpxwy1439907208.jpg")
  }
}
