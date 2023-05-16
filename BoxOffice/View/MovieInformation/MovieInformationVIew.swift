//
//  MovieInformationVIew.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/14.
//

import UIKit

final class MovieInformationVIew: UIView {
    
    var information: MovieInformationItem?
    
    private let moviePoster = UIImageView()
    
    private let directorLabel: UILabel = {
        var label = UILabel()
        label.text = "감독"
        label.font = .preferredFont(forTextStyle: .callout)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        
        moviePoster.image = information?.poster
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(moviePoster)
        NSLayoutConstraint.activate([
            moviePoster.heightAnchor.constraint(equalToConstant: 300),
            moviePoster.widthAnchor.constraint(equalToConstant: 200),
            moviePoster.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            moviePoster.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
