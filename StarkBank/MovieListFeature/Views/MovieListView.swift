//
//  MovieListView.swift
//  StarkBank
//
//  Created by Gabriel Ferreira de Carvalho on 19/07/22.
//

import UIKit

class MovieListView: UIView {
    private lazy var tableView: UITableView = {
        let t = UITableView(frame: .zero, style: .plain)
        t.translatesAutoresizingMaskIntoConstraints = false
        t.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return t
    }()
    
    init() {
        super.init(frame: .zero)
        setupHirearchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableViewBindings(dataSource: UITableViewDataSource,
                                delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
    func reloadList() {
        tableView.reloadData()
    }
    
    private func setupHirearchy() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
