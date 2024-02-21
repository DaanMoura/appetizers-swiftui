//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Daniel Moura on 11/02/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    let image: Image?
    let placeholder: Image
    
    var body: some View {
        image?.resizable() ?? placeholder.resizable()
    }
}

struct AppetizerRemoteImage: View {
    let url: String
    
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        RemoteImage(image: imageLoader.image, placeholder: Image("food-placeholder"))
            .onAppear {
                imageLoader.load(fromURLString: url)
            }
    }
}
