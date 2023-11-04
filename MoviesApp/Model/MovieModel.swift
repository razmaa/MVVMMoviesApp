//
//  MovieModel.swift
//  MoviesApp
//
//  Created by nika razmadze on 03.11.23.
//

import UIKit

class Movie {
    let name: String
    var isFavorite: Bool
    let rating: Double
    let description: String
    let certificate: String
    let runtime: Double
    let release: Int
    let genre: String
    let director: String
    let cast: String
    let poster: UIImage
    

    init(name: String, isFavorite: Bool, rating: Double, description: String, certificate: String, runtime: Double, release: Int, genre: String, director: String, cast: String, poster: UIImage) {
        self.name = name
        self.isFavorite = isFavorite
        self.rating = rating
        self.description = description
        self.certificate = certificate
        self.runtime = runtime
        self.release = release
        self.genre = genre
        self.director = director
        self.cast = cast
        self.poster = poster
    }
}
