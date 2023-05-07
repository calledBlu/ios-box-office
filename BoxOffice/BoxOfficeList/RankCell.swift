//
//  RankCell.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/07.
//

import UIKit

final class RankCell: UICollectionViewListCell {
    
    private let rankNumberTextView: UILabel = {
        let textView = UILabel(frame: .zero)
        textView.text = "1"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .red
        return textView
    }()
    
    private let rankDetailTextView: UILabel = {
        let textView = UILabel(frame: .zero)
        textView.text = "신작"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .blue
        return textView
    }()
    
    private let movieNameTextView: UILabel = {
        let textView = UILabel(frame: .zero)
        textView.text = "경관의 피"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .yellow
        return textView
    }()
    
    private let movieDetailTextView: UILabel = {
        let textView = UILabel(frame: .zero)
        textView.text = "오늘 64,050 / 총 69,228"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .systemPink
        return textView
    }()
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)

        configureHierarchy()
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
            rankStackView.widthAnchor.constraint(equalToConstant: 30),
            
            movieStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            movieStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            movieStackView.leadingAnchor.constraint(equalTo: rankStackView.trailingAnchor, constant: 20)
        ])
    }
}
