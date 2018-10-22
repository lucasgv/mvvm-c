//
//  RespositoryViewModel.swift
//  MVVM_Coordinators
//
//  Created by Lucas Valle on 22/10/2018.
//  Copyright © 2018 Lucas Valle. All rights reserved.
//

import Foundation
import UIKit
import Moya
import Moya_ModelMapper

extension RepositoryViewModel {
    enum State {
        case loading
        case ready([Repository])
        case error
    }
}

public class RepositoryViewModel {
    
    private let provider = MoyaProvider<GitHubService>()
    private let viewController: ViewController
    var repositories: [Repository] = []
    
    private var stateRepositories: State = .loading {
        didSet {
            switch stateRepositories {
            case .ready(let items):
                self.repositories = items
                self.viewController.tableView.reloadData()
                print("ready")
            case .loading:
                print("loading")
            case .error:
                print("error")
            }
        }
    }
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func getRepositories() {
        self.stateRepositories = .loading
        provider.request(.repositories) { result in
            switch result {
            case .success(let response):
                do {
                    self.stateRepositories = .ready(try response.map(to: [Repository].self))
                } catch {
                    self.stateRepositories = .error
                }
            case .failure:
                self.stateRepositories = .error
            }
        }
    }
}
