//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import SwiftUI
import UIKit

private enum Section: Hashable {

    case main
}

private struct Item: Hashable {

    let rank: Rank
    let movieName: String
    let audiCnt: String // 오늘
    let audiAcc: String // 총

    private let identifier = UUID()

    static let all = [
        Item(rank: Rank(rank: "1", rankInten: "0", rankOldAndNew: RankOldAndNewDTO.new), movieName: "영화 이름", audiCnt: "오늘", audiAcc: "총"),
        Item(rank: Rank(rank: "2", rankInten: "-1", rankOldAndNew: RankOldAndNewDTO.old), movieName: "영화 이름", audiCnt: "오늘", audiAcc: "총"),
        Item(rank: Rank(rank: "3", rankInten: "2", rankOldAndNew: RankOldAndNewDTO.old), movieName: "영화 이름", audiCnt: "오늘", audiAcc: "총"),
        Item(rank: Rank(rank: "4", rankInten: "0", rankOldAndNew: RankOldAndNewDTO.old), movieName: "영화 이름", audiCnt: "오늘", audiAcc: "총"),
    ]

}

private struct Rank: Hashable {
    let rank: String
    let detail: NSMutableAttributedString

    init(rank: String, rankInten: String, rankOldAndNew: RankOldAndNewDTO) {
        self.rank = rank
        self.detail = NSMutableAttributedString()

        let imageAttachment = NSTextAttachment()

        let upMark = UIImage(systemName: "arrowtriangle.up.fill")?.withTintColor(.systemRed)
        let downMark = UIImage(systemName: "arrowtriangle.down.fill")?.withTintColor(.systemBlue)

        guard rankOldAndNew == RankOldAndNewDTO.old else {
            detail.append((NSAttributedString(string: "신작", attributes: [.foregroundColor: UIColor.systemRed])))
            return
        }

        guard !(rankInten.contains("-")) else {
            imageAttachment.image = downMark
            detail.append(NSMutableAttributedString(attachment: imageAttachment))
            let number = rankInten.trimmingCharacters(in: ["-"])
            detail.append(NSAttributedString(string: number))
            return
        }

        guard rankInten != "0" else {
            detail.append(NSMutableAttributedString(string: "-"))
            return
        }

        imageAttachment.image = upMark
        detail.append(NSMutableAttributedString(attachment: imageAttachment))
        detail.append(NSAttributedString(string: rankInten))
    }


}

class ViewController: UIViewController, UICollectionViewDelegate {

    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>? = nil
    private lazy var collectionView: UICollectionView = UICollectionView(frame: view.safeAreaLayoutGuide.layoutFrame, collectionViewLayout: createLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        configureHierarchy()
        configureDataSource()
    }
}

extension ViewController {
    private func createLayout() -> UICollectionViewLayout {

        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)

        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}

extension ViewController {
    private func configureHierarchy() {

        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
    }

    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<CustomListCell, Item> { (cell, indexPath, item) in
            cell.updateWithItem(item)
        }

        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
        (collectionView: UICollectionView, indexpath: IndexPath, item: Item) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexpath, item: item)
        }

        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Item.all)
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
}

fileprivate extension UIConfigurationStateCustomKey {
    static let item = UIConfigurationStateCustomKey("com.apple.ItemListCell.item")
}

private extension UICellConfigurationState {
    var item: Item? {
        set { self[.item] = newValue }
        get { return self[.item] as? Item }
    }
}

private class ItemListCell: UICollectionViewListCell {
    private var item: Item? = nil

    func updateWithItem(_ newItem: Item) {
        guard item != newItem else { return }
        item = newItem
        setNeedsUpdateConfiguration()
    }

    override var configurationState: UICellConfigurationState {
        var state = super.configurationState
        state.item = self.item
        return state
    }

}

private class CustomListCell: ItemListCell {

    private let rankLabel = UILabel()
    private let rankIntenLabel = UILabel()
    private lazy var rankStackView = UIStackView(arrangedSubviews: [rankLabel, rankIntenLabel])

    private let movieNameLabel = UILabel()
    private let movieAudienceLabel = UILabel()
    private lazy var movieStackView = UIStackView(arrangedSubviews: [movieNameLabel, movieAudienceLabel])


    private func setupViewsIfNeeded() {
        rankStackView.axis = .vertical
        movieStackView.axis = .vertical

        rankLabel.textAlignment = .center
        rankIntenLabel.textAlignment = .center

        contentView.addSubview(rankStackView)
        contentView.addSubview(movieStackView)

        rankStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            rankStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            rankStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            rankStackView.widthAnchor.constraint(equalToConstant: 30)
        ])

        movieStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieStackView.topAnchor.constraint(equalTo: rankStackView.topAnchor),
            movieStackView.leadingAnchor.constraint(equalTo: rankStackView.trailingAnchor, constant: 30),
            movieStackView.bottomAnchor.constraint(equalTo: rankStackView.bottomAnchor),
        ])
    }

    private var separatorConstraint: NSLayoutConstraint?
    private func updateSeparatorConstraint() {

        let constraint = separatorLayoutGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        constraint.isActive = true
        separatorConstraint = constraint
    }

    override func updateConfiguration(using state: UICellConfigurationState) {
        setupViewsIfNeeded()

        guard let stateItem = state.item else { return }

        rankLabel.text = stateItem.rank.rank
        rankLabel.font = .preferredFont(forTextStyle: .largeTitle)
        rankIntenLabel.attributedText = stateItem.rank.detail
        rankIntenLabel.font = .preferredFont(forTextStyle: .callout)
        if rankIntenLabel.attributedText == NSAttributedString(string: "신작") {
            rankIntenLabel.textColor = .systemRed
        }
        movieNameLabel.text = stateItem.movieName
        movieNameLabel.font = .preferredFont(forTextStyle: .title3)
        movieAudienceLabel.text = stateItem.audiCnt + stateItem.audiAcc

        updateSeparatorConstraint()
    }
}







#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif


struct VCPreView:PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}
