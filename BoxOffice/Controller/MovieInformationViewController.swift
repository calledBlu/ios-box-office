//
//  MovieInformationViewController.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/16.
//

import UIKit

class MovieInformationViewController: UIViewController {

    private let presentationProvider = PresentationProvider()

    private lazy var indicatorView = ActivityIndicatorView(frame: view.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()

        presentationProvider.infoDelegate = self
        view.backgroundColor = .systemBackground
        view.addSubview(indicatorView)
    }

    init(movieCode: String) {
        presentationProvider.movieCode = movieCode

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MovieInformationViewController: InformationDelegate {
    func call() {
        print(presentationProvider.getMovieInformation())
        print(presentationProvider.getMoviePoster())

        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
        }
    }
}
