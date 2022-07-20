//
//  MovieListViewController.swift
//  StarkBank
//
//  Created by Gabriel Ferreira de Carvalho on 19/07/22.
//

import UIKit

class MovieListViewController: UIViewController {
    private var contentView: MovieListView
    private var movieListDataSource: MovieListDataSource
    private var viewModel: MovieListViewModelProtocol
    
    init(view: MovieListView,
         movieListDataSource: MovieListDataSource,
         viewModel: MovieListViewModelProtocol) {
        self.contentView = view
        self.movieListDataSource = movieListDataSource
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.setupTableViewBindings(dataSource: self.movieListDataSource,
                                                delegate: self)
        fetchMovies()
    }
    
    private func fetchMovies() {
        viewModel.fetchMovies {[weak self] items in
            self?.movieListDataSource.data.append(contentsOf: items)
            self?.contentView.reloadList()
        }
    }
}

extension MovieListViewController: UITableViewDelegate {
    var currentLastIndexPath: IndexPath {
        IndexPath(row: movieListDataSource.data.count-1, section: 0)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if currentLastIndexPath == indexPath {
            fetchMovies()
        }
    }

}
