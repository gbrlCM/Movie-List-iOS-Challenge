//
//  MovieListPrefetchingDataSource.swift
//  StarkBank
//
//  Created by Gabriel Ferreira de Carvalho on 19/07/22.
//

import Foundation
import UIKit

final class MovieListDataSource: NSObject, UITableViewDataSource {
    var data: [Int] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}
