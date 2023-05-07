//
//  BoxOfficeViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

class BoxOfficeViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView =  UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
    }

    private func configureHierarchy() {
        
        // 이걸 잡으면 그 외 autolayout을 잡지 않아도 되는가?
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.frame = view.frame // 프레임 지정
        view.addSubview(collectionView)
        collectionView.dataSource = self
        
        collectionView.register(RankCell.self, forCellWithReuseIdentifier: "\(RankCell.self)")
    }

    private func createLayout() -> UICollectionViewLayout {
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .grouped)

        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
}

extension BoxOfficeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(RankCell.self)", for: indexPath)
        
        return cell
    }
    
    
}
