//
//  MovieViewModel.swift
//  StarkBank
//
//  Created by Gabriel Ferreira de Carvalho on 19/07/22.
//

import Foundation

protocol MovieListViewModelProtocol {
    func fetchMovies(_ completionHandler: @escaping ([Int]) -> Void)
}

final class MovieListViewModel: MovieListViewModelProtocol {
    private var currentPage: Int = 0
    
    func fetchMovies(_ completionHandler: @escaping ([Int]) -> Void) {
        let startElement = currentPage*50
        let items = Array(startElement...startElement+50)
        
        DispatchQueue.main.async {
            completionHandler(items)
        }
        
        currentPage += 1
    }
}
