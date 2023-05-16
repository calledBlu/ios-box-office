//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

class BoxOfficeViewController: UIViewController {
    
    private let presentationProvider = PresentationProvider()
    private var dataSource: UICollectionViewDataSource?
    
    private var boxOffices: [BoxOfficeItem] {
        self.presentationProvider.getBoxOffices()
    }
    
    private lazy var collectionView = BoxOfficeCollectionView(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = presentationProvider.getBoxOfficeDate()
        
        presentationProvider.loadBoxOffices()
        collectionView.delegate = self
        
        configureHierarchy()
        configureDataSource()
        configureRefreshControl()
    }
    
    private func configureHierarchy() {
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
    }
    
    private func configureDataSource() {
        
        presentationProvider.boxOfficeCall = {
            let boxOfficeDataSource = BoxOfficeDataSource()
            boxOfficeDataSource.boxOffices = self.presentationProvider.getBoxOffices()
            self.dataSource = boxOfficeDataSource
            
            DispatchQueue.main.async {
                self.collectionView.dataSource = self.dataSource
            }
        }
    }
}

extension BoxOfficeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectMovie = boxOffices[indexPath.item]
        
        let movieInformationViewController = MovieInformationViewController(movieCode: selectMovie.movieCode)
        movieInformationViewController.title = selectMovie.name
        navigationController?.pushViewController(movieInformationViewController, animated: true)
    }
}

extension BoxOfficeViewController {
    
    func configureRefreshControl() {
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        // 네트워크로 데이터 불러오는 작업 수행
        collectionView.reloadData()
        
        DispatchQueue.main.async {
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
}
