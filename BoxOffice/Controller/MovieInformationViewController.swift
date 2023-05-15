//
//  MovieInformationViewController.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/14.
//

import UIKit

final class MovieInformationViewController: UIViewController {

    private let movieInformationView = MovieInformationVIew()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "특송"
        

    }
    
    override func loadView() {
        self.view = movieInformationView
    }

}
