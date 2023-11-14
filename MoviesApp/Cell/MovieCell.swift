//
//  MovieCell.swift
//  MoviesApp
//
//  Created by nika razmadze on 03.11.23.
//

import UIKit

protocol MovieCellDelegate: AnyObject {
    func didTapLikeButton(at index: Int)
}

final class MovieCell: UICollectionViewCell {
    
    //MARK: - Properties
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.tintColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray3
        return label
    }()
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "PT Root UI", size: 14)
        label.isEnabled = false
        return label
    }()
    
    var isLiked: Bool = false
    
    weak var delegate: MovieCellDelegate?
    
    //MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    func configure(with model: Movie) {
//        isLiked = model.isFavorite
        movieTitleLabel.text = model.title
        categoryLabel.text = model.type
                
        if let imageUrl = URL(string: model.poster) {
            URLSession.shared.dataTask(with: imageUrl) { data, _, error in
                if let error = error {
                    print("Error loading image: \(error.localizedDescription)")
                    return
                }
                
                if let data = data {
                    DispatchQueue.main.async {
                        self.movieImageView.image = UIImage(data: data)
                    }
                } else {
                    self.movieImageView.image = UIImage(named: "placeholderImage")
                }
            }.resume()
        }
        
        let heartImage = isLiked ? UIImage(systemName: "suit.heart.fill") : UIImage(systemName: "suit.heart")
        likeButton.setImage(heartImage, for: .normal)
    }
    
    //MARK: - Private methods
    
    private func setupUI() {
        setupStackView()
        setupLikeButton()
        setupRatingLabel()
        setUpConstraints()
    }
    private func setupStackView() {
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(movieImageView)
        stackView.addArrangedSubview(movieTitleLabel)
        stackView.addArrangedSubview(categoryLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            ratingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            likeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            likeButton.widthAnchor.constraint(equalToConstant: 30),
            likeButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    private func setupLikeButton() {
        contentView.addSubview(likeButton)
    }
    
    private func setupRatingLabel() {
        contentView.addSubview(ratingLabel)
    }
    
    @objc private func likeButtonTapped() {
        isLiked.toggle()
        let heartImage = isLiked ? UIImage(systemName: "suit.heart.fill") : UIImage(systemName: "suit.heart")
        likeButton.setImage(heartImage, for: .normal)
        delegate?.didTapLikeButton(at: self.tag)
    }
}
