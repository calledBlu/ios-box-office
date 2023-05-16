//
//  PosterItem.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/15.
//

import UIKit

struct MoviePosterItem: ViewDisplayable {
    let posterURL: String

    func translateUIImage() -> UIImageView {
        var imageView = UIImageView()

        let url = URL(string: posterURL)
        imageView.load(url: url!)

        return imageView
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
