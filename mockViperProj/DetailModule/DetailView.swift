//
//  DetailView.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyView {
    func update(with posts: [Post])
    func update(with error: String)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    var presenter: AnyPresenter?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "postCell")
        tableView.isHidden = true
        return tableView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        label.textColor = .systemBackground
        return label
    }()
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(label)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = view.center
    }
    
    func update(with posts: [Post]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.posts = posts
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.posts = []
            self.tableView.isHidden = true
            self.label.text = error
            self.label.isHidden = false
        }
    }
}

//MARK: - Table
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].body
        return cell
    }
    
    
}
