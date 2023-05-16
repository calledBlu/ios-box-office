//
//  MovieInformationViewController.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/14.
//

import UIKit

final class MovieInformationViewController: UIViewController {

    private let presentationProvider = PresentationProvider()
    private let movieInformationView = MovieInformationVIew()
    
    var movieCode: String = "" {
        didSet {
            presentationProvider.loadMovieInformation(movieCode: movieCode)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "특송"
        
        presentationProvider.movieInformationDelegate = self
        setupMovieInformationView()
        
    }
    
    override func loadView() {
        self.view = movieInformationView
    }
    
    func setupMovieInformationView() {
        
        let movieInformation = presentationProvider.getMovieInformation()
        movieInformationView.information = movieInformation
    }

}

extension MovieInformationViewController: MovieInformationPresentationDelegate {
    
    func callMovieInformation() {
        
        print("실행")
        setupMovieInformationView()
    }
}
