//
//  ImageLoader.swift
//  CoreDataProject
//
//  Created by dirtbag on 12/3/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import UIKit

class ImageLoader {
    static let shared = ImageLoader()
    private init() {}
    
    func loadImageInto(imageView: UIImageView, urlString: String) {
                
        // load real image
        DispatchQueue.global(qos: .userInteractive).async {
            
            self.loadImage(urlString: urlString) { (data) in

                if let image = UIImage(data: data) {
                    self.updateUI(imageView: imageView, image: image)
                }
            }
        }
    }
    
    private func updateUI(imageView: UIImageView, image: UIImage) {
        DispatchQueue.main.async {
            imageView.image = image
        }
    }
    
    private func loadImage(urlString: String, imageLoaded: @escaping (Data) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else { return }

             imageLoaded(data)
        }.resume()
    }
}
