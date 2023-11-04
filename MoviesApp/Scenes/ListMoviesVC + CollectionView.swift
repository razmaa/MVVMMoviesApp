//
//  ListMoviesVC + CollectionView.swift
//  MoviesApp
//
//  Created by nika razmadze on 03.11.23.
//

import UIKit

extension ListMoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = allMovies[indexPath.row]
        let detailsViewController = DetailsViewController()
        detailsViewController.configure(with: selectedMovie)
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



extension ListMoviesViewController: MovieCellDelegate {
    func didTapLikeButton(at index: Int) {
        allMovies[index].isFavorite.toggle()
        allMovies.swapAt(index, 0)
    }
    
    
}
