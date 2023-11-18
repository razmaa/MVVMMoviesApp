//
//  ListMoviesViewController.swift
//  MoviesApp
//
//  Created by nika razmadze on 03.11.23.
//

import UIKit

final class ListMoviesViewController: UIViewController {
    
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
        return collectionView
    }()
    
    private var profileButton = UIBarButtonItem()
    
    var viewModel = ListMoviesViewModel()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchMovies()
    }
    
    //MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = backgroundColor
        setUpNavigationBar()
        setupStackView()
        setupHeaderLabel()
        setupCollectionView()
    }
    
    private func fetchMovies() {
        viewModel.fetchMovies { [weak self] in
            DispatchQueue.main.async {
                self?.moviesCollectionView.reloadData()
            }
            
        }
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
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    private func setupHeaderLabel() {
        headerLabel.frame = CGRect(x: 0, y: 0, width: 342, height: 29)
        headerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        mainStackView.addArrangedSubview(headerLabel)
    }
    
    private func setupCollectionView() {
        moviesCollectionView.backgroundColor = backgroundColor
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        mainStackView.addArrangedSubview(moviesCollectionView)
    }
    
}


// MARK: - CollectionView DataSource
extension ListMoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath)
        let selectedMovie = allMovies[indexPath.row]
        if let movieCell = cell as? MovieCell {
            movieCell.configure(with: selectedMovie)
        }
        
        return cell
    }
}

//MARK: - CollectionView Delegate
extension ListMoviesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = allMovies[indexPath.row].imdbID
        let detailsViewController = DetailsViewController()
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}

extension ListMoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.bounds.width - 32
        let cellWidth = (availableWidth - 20) / 2
        let cellHeight: CGFloat = 278
        return CGSize(width: cellWidth, height: cellHeight)
    }
}


//MARK: - MovieCell Delegate
extension ListMoviesViewController: MovieCellDelegate {
    
    func didTapLikeButton(at index: Int) {
        //allMovies[index].isFavorite.toggle()
        allMovies.swapAt(index, 0)
    }
}
