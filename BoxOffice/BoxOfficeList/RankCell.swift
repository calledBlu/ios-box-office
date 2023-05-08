//
//  RankCell.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/07.
//

import UIKit

final class RankCell: CustomRankListCell {
    
    private let rankNumberTextView: UILabel = {
        let textView = UILabel(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .red
        return textView
    }()
    
    private let rankDetailTextView: UILabel = {
        let textView = UILabel(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .blue
        return textView
    }()
    
    private let movieNameTextView: UILabel = {
        let textView = UILabel(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .yellow
        return textView
    }()
    
    private let movieDetailTextView: UILabel = {
        let textView = UILabel(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .systemPink
        return textView
    }()
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)

        configureHierarchy()
        
        rankNumberTextView.text = state.rankItem?.rank.number
        rankDetailTextView.text = state.rankItem?.rank.detail
        
        movieNameTextView.text = state.rankItem?.name
        movieDetailTextView.text = state.rankItem?.audience
        
    }
    
    private func configureHierarchy() {
        
        let rankStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [rankNumberTextView, rankDetailTextView])
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.distribution = .fillEqually
            stackView.spacing = 2
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
        }()
        
        let movieStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [movieNameTextView, movieDetailTextView])
            stackView.axis = .vertical
            stackView.alignment = .leading
            stackView.distribution = .fillEqually
            stackView.spacing = 2
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
        }()
        
        contentView.addSubview(rankStackView)
        contentView.addSubview(movieStackView)
        
        NSLayoutConstraint.activate([
            rankStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            rankStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rankStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
            movieStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            movieStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            movieStackView.leadingAnchor.constraint(equalTo: rankStackView.trailingAnchor, constant: 20)
        ])
    }
}

class CustomRankListCell: UICollectionViewListCell {
    
    private var rankItem: RankItem? = nil
    
    func updateWithItem(_ newItem: RankItem) {
        guard rankItem != newItem else { return }
        rankItem = newItem
        setNeedsUpdateConfiguration()
    }
    
    override var configurationState: UICellConfigurationState {
        var state = super.configurationState
        state.rankItem = self.rankItem
        return state
    }
}


extension UIConfigurationStateCustomKey {
    
    static let rankItem = UIConfigurationStateCustomKey("com.sunny.RankCell.rankItem")
}

extension UICellConfigurationState {
    
    var rankItem: RankItem? {
        set { self[.rankItem] = newValue }
        get { return self[.rankItem] as? RankItem }
    }
}
