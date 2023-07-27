//
//  View.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation
import UIKit

// ViewController
// protocol
// reference presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
}

protocol UserViewProtocol: AnyView {
    func update(with users: [User])
    func update(with error: String)
}

class UserViewController: UIViewController, UserViewProtocol {
    var presenter: AnyPresenter?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func update(with users: [User]) {
        //
    }
    
    func update(with error: String) {
        //
    }
    
}

//MARK: - TableView Protocols
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
