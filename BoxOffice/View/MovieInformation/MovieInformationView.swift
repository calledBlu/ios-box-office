//
//  MovieInformationVIew.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/14.
//

import UIKit

final class MovieInformationView: UIView {
    
    var information: MovieInformationItem? {
        didSet {
            configureMovieInformation()
        }
    }
    
    private let moviePoster = UIImageView()
    private let directorStackView = UIHorizontalStackView(title: "감독")
    private let productionYearStackView = UIHorizontalStackView(title: "제작년도")
    private let openDateStackView = UIHorizontalStackView(title: "개봉일")
    private let showTimeStackView = UIHorizontalStackView(title: "상영시간")
    private let auditGradeStackView = UIHorizontalStackView(title: "관람등급")
    private let nationStackView = UIHorizontalStackView(title: "제작국가")
    private let genreStackView = UIHorizontalStackView(title: "장르")
    private let actorStackView = UIHorizontalStackView(title: "배우")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        
        configureMovieInformation()
        configureMoviePosterHierarchy()
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureMovieInformation() {
        
        DispatchQueue.main.async {
            self.moviePoster.image = self.information?.poster
            self.directorStackView.updateDataLabel(self.information?.director)
            self.productionYearStackView.updateDataLabel(self.information?.productionYear)
            self.openDateStackView.updateDataLabel(self.information?.openDate)
            self.showTimeStackView.updateDataLabel(self.information?.showTime)
            self.auditGradeStackView.updateDataLabel(self.information?.auditGrade)
            self.nationStackView.updateDataLabel(self.information?.nation)
            self.genreStackView.updateDataLabel(self.information?.genre)
            self.actorStackView.updateDataLabel(self.information?.actor)
        }
    }
    
    private func configureMoviePosterHierarchy() {
        
        moviePoster.sizeToFit()
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(moviePoster)
        NSLayoutConstraint.activate([
            moviePoster.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            moviePoster.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            moviePoster.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            moviePoster.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func configureHierarchy() {
        
        let totalStackView: UIStackView = {
            let arrangedSubviews = [ directorStackView, productionYearStackView, openDateStackView, showTimeStackView, auditGradeStackView, nationStackView, genreStackView, actorStackView ]
            let stackView = UIVerticalStackView(arrangedSubviews: arrangedSubviews)
            stackView.spacing = 7
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        self.addSubview(totalStackView)
        NSLayoutConstraint.activate([
            totalStackView.topAnchor.constraint(equalTo: self.moviePoster.bottomAnchor),
            totalStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            totalStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
    }
    
}
