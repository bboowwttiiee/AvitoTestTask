//
//  ViewController.swift
//  AvitoTestTask
//
//  Created by bowtie on 02.05.2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Screen Elements
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - PROPERTIES
    private var viewModels = [TableViewCellViewModel]()
    
    // MARK: - viewDidLoad Function
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        Parser.shared.getAvito { avito in
            self.viewModels = avito.company.employees.compactMap({
                TableViewCellViewModel(name: $0.name, number: $0.number, skills: $0.skills)
            })
            self.tableView.reloadData()
        }
    }
}

// MARK: - ViewController Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as? TableViewCell) else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
}
