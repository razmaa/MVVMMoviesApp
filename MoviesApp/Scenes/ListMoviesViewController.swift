//
//  ListMoviesViewController.swift
//  MoviesApp
//
//  Created by nika razmadze on 03.11.23.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    let backgroundColor = UIColor(red: 31/255, green: 41/255, blue: 61/255, alpha: 0.7/1)
    
    //MARK: - Properties
    private let mainStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(red: 31/255, green: 41/255, blue: 61/255, alpha: 0.7/1)
        stackView.axis = .vertical
        return stackView
    }()
    
    private let headerLabel: UILabel = {
        
        let label = UILabel()
        label.text = "New this week"
        label.textColor = .white
        return label
    }()
    
    private let moviesCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private var profileButton = UIBarButtonItem()
    
    //MARK: - Data
    var allMovies = [
        Movie(name: "Batman", isFavorite: false, rating: 9.1, description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.", certificate: "16+", runtime: 2.56, release: 2022, genre: "Action", director: "Mat Reeves", cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro", poster: UIImage(named: "Batman_poster")!),
        Movie(name: "Spider-man", isFavorite: false, rating: 10, description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.", certificate: "12+", runtime: 2.56, release: 2007, genre: "Action", director: "Mat Reeves", cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro", poster: UIImage(named: "Spider-man")!),
        Movie(name: "Uncharted", isFavorite: false, rating: 9.0, description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.", certificate: "16+", runtime: 2.56, release: 2022, genre: "Action", director: "Mat Reeves", cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro", poster: UIImage(named: "Uncharted")!),
        Movie(name: "Run, Forrest, run!", isFavorite: false, rating: 10, description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.", certificate: "16+", runtime: 2.56, release: 2022, genre: "Action", director: "Mat Reeves", cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro", poster: UIImage(named: "Forest_gump")!),
        Movie(name: "Kukaracha", isFavorite: false, rating: 9.3, description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.", certificate: "16+", runtime: 2.56, release: 2022, genre: "Action", director: "Mat Reeves", cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro", poster: UIImage(named: "Kukaracha")!),
        Movie(name: "Batman", isFavorite: false, rating: 9.1, description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.", certificate: "16+", runtime: 2.56, release: 2022, genre: "Action", director: "Mat Reeves", cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro", poster: UIImage(named: "Batman_poster")!)
    ]
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = backgroundColor
        setUpNavigationBar()
        setupStackView()
        setupHeaderLabel()
        setupCollectionView()
    }
    
    private func setUpNavigationBar() {
        let profileButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        profileButtonView.backgroundColor = .orange
        profileButtonView.layer.cornerRadius = 8
        
        let profileLabel = UILabel()
        profileLabel.text = "Profile"
        profileLabel.textColor = .white
        profileLabel.sizeToFit()
        
        profileLabel.center = profileButtonView.center
        profileButtonView.addSubview(profileLabel)
        let profileButton = UIBarButtonItem(customView: profileButtonView)
        navigationItem.rightBarButtonItem = profileButton
    }
    
    private func setupStackView() {
        view.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    private func setupHeaderLabel() {
        headerLabel.frame = CGRect(x: 0, y: 0, width: 342, height: 29)
        headerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        mainStackView.addArrangedSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
    }
    
    private func setupCollectionView() {
        moviesCollectionView.backgroundColor = backgroundColor
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        mainStackView.addArrangedSubview(moviesCollectionView)
        
        NSLayoutConstraint.activate([
            moviesCollectionView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 16),
            moviesCollectionView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -16),
        ])
    }
}
