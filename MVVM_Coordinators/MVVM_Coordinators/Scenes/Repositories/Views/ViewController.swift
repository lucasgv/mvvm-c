//
//  ViewController.swift
//  MVVM_Coordinators
//
//  Created by Lucas Valle on 15/10/2018.
//  Copyright © 2018 Lucas Valle. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: RepositoryViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RepositoryViewModel(viewController: self)
        viewModel.getRepositories()
    }
}

// MARK: - UITableView Data Source

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellRepository", for: indexPath)
        return cell
    }
}

