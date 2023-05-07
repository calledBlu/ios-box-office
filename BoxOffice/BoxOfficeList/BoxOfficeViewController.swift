//
//  BoxOfficeViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

enum Section {
    case main
}

class BoxOfficeViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView =  UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        return collectionView
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, RankItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureDataSource()
    }

    private func configureHierarchy() {
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        
        collectionView.register(RankCell.self, forCellWithReuseIdentifier: "\(RankCell.self)")
    }
    
    private func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<RankCell, RankItem> { (cell, indexPath, item) in
            
            cell.accessories = [.disclosureIndicator()]
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, RankItem>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, item: RankItem) -> UICollectionViewCell? in
            
            let collectionView = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
            return collectionView
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, RankItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(RankItem.mock)
        
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
    
}

extension BoxOfficeViewController {
    
    private func createLayout() -> UICollectionViewLayout {
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .grouped)

        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
}
