//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

class BoxOfficeViewController: UIViewController {
    
    private var dataSource: UICollectionViewDataSource?
    private let presentationProvider = PresentationProvider()

    private lazy var collectionView = BoxOfficeCollectionView(frame: .zero)
    private lazy var indicatorView = ActivityIndicatorView(frame: view.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Date.yesterday.formatData(type: .title)
        presentationProvider.date = Date.yesterday.formatData(type: .network)
        presentationProvider.delegate = self

        collectionView.delegate = self

        configureSelectDateButton()
        configureHierarchy()
        configureDataSource()
        configureRefreshControl()
    }
    
    private func configureHierarchy() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        view.addSubview(indicatorView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureDataSource() {
        
        let boxOfficeDataSource = BoxOfficeDataSource()
        boxOfficeDataSource.boxOffices = self.presentationProvider.getBoxOffices()
        dataSource = boxOfficeDataSource

        DispatchQueue.main.async {
            self.collectionView.dataSource = self.dataSource
        }
    }
}

extension BoxOfficeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let boxOffices = presentationProvider.getBoxOffices()
        let movieCode = boxOffices[indexPath.row].movieCode
        let movieName = boxOffices[indexPath.row].name

        let informationController = MovieInformationViewController(movieCode: movieCode)
        informationController.title = movieName

        self.navigationController?.pushViewController(informationController, animated: true)
    }
}

extension BoxOfficeViewController: PresentationDelegate {

    func call() {
        self.configureDataSource()
        
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
        }
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

extension BoxOfficeViewController {

    func configureSelectDateButton() {
        var addButton = UIBarButtonItem(title: "날짜선택", style: .plain, target: self, action: #selector(addButtonAction(_:)))
        self.navigationItem.rightBarButtonItem = addButton
    }

    @objc func addButtonAction(_ sender: UIBarButtonItem) {
            self.present(CalendarController(), animated: true)
     }
}



class CalendarController: UIViewController {

    var calendarView = UICalendarView()
    private let presentationProvider = PresentationProvider()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(calendarView)
        configureCalendarView()
    }

    func configureCalendarView() {

        let date = Date(timeIntervalSinceReferenceDate: )

        let gregorianCalendar = Calendar(identifier: .gregorian)
        calendarView.calendar = gregorianCalendar
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.fontDesign = .rounded
        calendarView.visibleDateComponents = gregorianCalendar.dateComponents([.year, .month, .day], from: Date.yesterday)

        calendarView.availableDateRange = DateInterval(start: Date.distantPast, end: Date.yesterday)

        calendarView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.topAnchor),
            calendarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
