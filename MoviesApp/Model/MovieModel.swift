//
//  MovieModel.swift
//  MoviesApp
//
//  Created by nika razmadze on 03.11.23.
//

import UIKit

struct MovieSearchResult: Decodable {
    let Search: [Movie]
    let totalResults: String
    let Response: String
}

struct Movie: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case imdbID
        case poster = "Poster"
    }
    
    let title: String
    let year: String
    let type: String
    let imdbID: String
    var poster: String
    
}



var allMovies: [Movie] = []
