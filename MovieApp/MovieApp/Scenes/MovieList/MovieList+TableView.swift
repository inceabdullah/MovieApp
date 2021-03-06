//
//  MovieList+TableView.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import UIKit

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListViewModel.getMovies().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.movieListTableViewIdentifier, for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        tableView.backgroundColor = .black
    
        let movie = movieListViewModel.getMovies()[indexPath.row]
        cell.configureMovie(movie: movie)
        cell.row = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = UINavigationController(rootViewController: MovieDetailViewController(indexPath.row))
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: false)
    }
}
