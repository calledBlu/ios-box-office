//
//  BoxOfficeCollectionViewController.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/08.
//

import UIKit
//
//private enum Section: Hashable {
//
//    case main
//}
//
//private struct Item: Hashable {
//
//    let rank: String
//    let rankInten: String
//    let rankOldAndNew: RankOldAndNewDTO
//    let movieName: String
//    let audiCnt: String // 오늘
//    let audiAcc: String // 총
//
//    private let identifier = UUID()
//
//    static let all = [
//        Item(rank: "1", rankInten: "-1", rankOldAndNew: RankOldAndNewDTO.old, movieName: "영화 이름", audiCnt: "오늘", audiAcc: "총")
//    ]
//}
//
//class BoxOfficeCollectionViewController: UIViewController {
//
//    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>? = nil
//    private lazy var collectionView: UICollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
////    private var collectionView: UICollectionView? = nil
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureHierarchy()
//
//    }
//}
//
//extension BoxOfficeCollectionViewController {
//    private func createLayout() -> UICollectionViewLayout {
//
//        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
//
//        return UICollectionViewCompositionalLayout.list(using: configuration)
//    }
//}
//
//extension BoxOfficeCollectionViewController {
//    private func configureHierarchy() {
//
////        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectionView.delegate = self
//    }
//
//    private func configureDataSource() {
//        let cellRegistration = UICollectionView.CellRegistration<CustomListCell, Item> { (cell, indexPath, item) in
//            cell.updateWithItem(item)
//        }
//
//        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
//        (collectionView: UICollectionView, indexpath: IndexPath, item: Item) -> UICollectionViewCell? in
//            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexpath, item: item)
//        }
//
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
//        snapshot.appendSections([.main])
//        snapshot.appendItems(Item.all)
//        dataSource?.apply(snapshot, animatingDifferences: false)
//    }
//}
//
//extension BoxOfficeCollectionViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//    }
//}
//
//fileprivate extension UIConfigurationStateCustomKey {
//    static let item = UIConfigurationStateCustomKey("com.apple.ItemListCell.item")
//}
//
//private extension UICellConfigurationState {
//    var item: Item? {
//        set { self[.item] = newValue }
//        get { return self[.item] as? Item }
//    }
//}
//
//private class ItemListCell: UICollectionViewListCell {
//    private var item: Item? = nil
//
//    func updateWithItem(_ newItem: Item) {
//        guard item != newItem else { return }
//        item = newItem
//        setNeedsUpdateConfiguration()
//    }
//
//    override var configurationState: UICellConfigurationState {
//        var state = super.configurationState
//        state.item = self.item
//        return state
//    }
//}
//
//private class CustomListCell: ItemListCell {
//
//    private let rankLabel: UILabel()
//    private let rankIntenLabel: UILabel()
//    private let rankStackView = UIStackView(arrangedSubviews: [rankLabel, rankIntenLabel])
//
//    private let movieNameLabel: UILabel()
//    private let movieAudienceLabel: UILabel()
//    private let movieStackView = UIStackView(arrangedSubviews: [movieNameLabel, movieAudienceLabel])
//
//    private func setupViewsIfNeeded() {
//        guard customViewConstraints == nil else { return }
//
//        contentView.addSubview(rankStackView)
//        contentView.addSubview(movieStackView)
//
//        )
//        NSLayoutConstraint.activate([
//            listContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            listContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            listContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            categoryIconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            constraints.categoryLabelLeading,
//            constraints.categoryLabelTrailing,
//            constraints.categoryIconTrailing
//        ])
//        customViewConstraints = constraints
//    }
//
//    private var separatorConstraint: NSLayoutConstraint?
//    private func updateSeparatorConstraint() {
//        guard let textLayoutGuide = listContentView.textLayoutGuide else { return }
//        if let existingConstraint = separatorConstraint, existingConstraint.isActive {
//            return
//        }
//        let constraint = separatorLayoutGuide.leadingAnchor.constraint(equalTo: textLayoutGuide.leadingAnchor)
//        constraint.isActive = true
//        separatorConstraint = constraint
//    }
//}
