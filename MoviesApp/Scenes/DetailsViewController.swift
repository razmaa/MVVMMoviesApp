//
//  DetailsViewController.swift
//  MoviesApp
//
//  Created by nika razmadze on 03.11.23.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    //MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 6
        stackView.distribution = .fill
        return stackView
    }()
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    private let descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1)
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    private let firstLineStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.spacing = 16
        return stackView
    }()
    
    private let certificateLabel: UILabel = {
        let label = UILabel()
        label.isEnabled = false
        label.text = "Certificate"
        return label
    }()
    
    private let movieCertificateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let secondLineStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.spacing = 16
        return stackView
    }()
    
    private let runTimeLabel: UILabel = {
        let label = UILabel()
        label.isEnabled = false
        label.text = "Runtime"
        return label
    }()
    
    private let movieRunTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let thirdLineStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.spacing = 16
        return stackView
    }()
    
    private let releaseLabel: UILabel = {
        let label = UILabel()
        label.isEnabled = false
        label.text = "Release"
        return label
    }()
    
    private let movieReleaseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let fourthLineStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.spacing = 16
        return stackView
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.isEnabled = false
        label.text = "Genre"
        return label
    }()
    
    private let movieGenreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let fifthLineStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.spacing = 16
        return stackView
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.isEnabled = false
        label.text = "Director"
        return label
    }()
    
    private let movieDirectorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let sixthLineStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.spacing = 16
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private let castLabel: UILabel = {
        let label = UILabel()
        label.isEnabled = false
        label.text = "Cast"
        return label
    }()
    
    private let movieCastLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let selectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("Select session", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Configure
//    
//    func configure(with model: Movie){
//        title = model.title
//        ratingLabel.text = "\(model.imdbRating) IMDB"
//        descriptionLabel.text = model.plot
//        movieCertificateLabel.text = model.rated
//        movieRunTimeLabel.text = model.runTime
//        movieReleaseLabel.text = String(model.year)
//        movieGenreLabel.text = model.genre
//        movieDirectorLabel.text = model.director
//        movieCastLabel.text = model.actors
//        
//        if let imageUrl = URL(string: model.poster) {
//            URLSession.shared.dataTask(with: imageUrl) { data, _, error in
//                if let error = error {
//                    print("Error loading image: \(error.localizedDescription)")
//                    return
//                }
//
//                if let data = data {
//                    DispatchQueue.main.async {
//                        self.movieImageView.image = UIImage(data: data)
//                    }
//                }
//            }.resume()
//        }
//    }
//    
    //MARK: - Methods
    private func setupUI(){
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]
        setupMainStackView()
        setupDescriptionStackView()
        setupConstraints()
    }
    
    private func setupMainStackView(){
        view.backgroundColor = UIColor(red: 31/255, green: 41/255, blue: 61/255, alpha: 0.7/1)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(movieImageView)
        mainStackView.addArrangedSubview(ratingLabel)
        mainStackView.addArrangedSubview(descriptionStackView)
        mainStackView.addArrangedSubview(selectButton)
    }
    
    private func setupDescriptionStackView() {
        descriptionStackView.addArrangedSubview(descriptionLabel)
        
        descriptionStackView.addArrangedSubview(firstLineStackView)
        firstLineStackView.addArrangedSubview(certificateLabel)
        firstLineStackView.addArrangedSubview(movieCertificateLabel)
        
        descriptionStackView.addArrangedSubview(secondLineStackView)
        secondLineStackView.addArrangedSubview(runTimeLabel)
        secondLineStackView.addArrangedSubview(movieRunTimeLabel)
        
        descriptionStackView.addArrangedSubview(thirdLineStackView)
        thirdLineStackView.addArrangedSubview(releaseLabel)
        thirdLineStackView.addArrangedSubview(movieReleaseLabel)
        
        descriptionStackView.addArrangedSubview(fourthLineStackView)
        fourthLineStackView.addArrangedSubview(genreLabel)
        fourthLineStackView.addArrangedSubview(movieGenreLabel)
        
        descriptionStackView.addArrangedSubview(fifthLineStackView)
        fifthLineStackView.addArrangedSubview(directorLabel)
        fifthLineStackView.addArrangedSubview(movieDirectorLabel)
        
        descriptionStackView.addArrangedSubview(sixthLineStackView)
        sixthLineStackView.addArrangedSubview(castLabel)
        sixthLineStackView.addArrangedSubview(movieCastLabel)
        
    }
    
    func setupConstraints() {        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            movieImageView.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, multiplier: 0.4),
            movieImageView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
            selectButton.widthAnchor.constraint(equalToConstant: 343),
            selectButton.heightAnchor.constraint(equalToConstant: 56),
            ratingLabel.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
}
