//
//  NewsCellDataSource.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/20/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit
class NewsCellDataSource:NSObject ,UITableViewDataSource {
    
    var viewModel:BaseViewModel?
    var numberOFCells:Int?
    init(viewModel:BaseViewModel,numberOFCells:Int) {
        self.viewModel = viewModel
        self.numberOFCells = numberOFCells
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOFCells ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.cellID)", for: indexPath ) as! NewsCell
        let cellVM = viewModel?.getCellViewModel(at: indexPath)
        cell.newsCellViewModel = cellVM as? NewsCellViewModel
        //cell.configureCell(news: news[indexPath.row])
        return cell
    }
    
    
}
