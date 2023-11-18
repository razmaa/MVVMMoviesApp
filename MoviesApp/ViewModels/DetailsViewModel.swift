//
//  DetailsViewModel.swift
//  MoviesApp
//
//  Created by nika razmadze on 18.11.23.
//

import UIKit


//TODO: Not Finished
class DetailsViewModel {
    private(set) var selectedMovie: Movie?

    func setSelectedMovie(_ movie: Movie) {
        selectedMovie = movie
    }
    
//    fetch additional details if needed
//    func fetchAdditionalDetails(completion: @escaping () -> Void) {
//        
//        completion()
//    }
}
