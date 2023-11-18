//
//  ListMoviesViewModel.swift
//  MoviesApp
//
//  Created by nika razmadze on 18.11.23.
//

import Foundation

class ListMoviesViewModel {
    private(set) var allMovies: [Movie] = []

    func fetchMovies(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=san&apikey=e7ec0aa0") else {
            completion()
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }

            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion()
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(MovieSearchResult.self, from: data)
                    self.allMovies = result.Search
                    completion()
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                    print("Failed data: \(String(data: data, encoding: .utf8) ?? "")")
                    completion()
                }
            }
        }.resume()
    }
}
