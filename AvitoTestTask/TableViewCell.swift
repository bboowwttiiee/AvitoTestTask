//
//  TableViewCell.swift
//  AvitoTestTask
//
//  Created by bowtie on 02.05.2022.
//

import UIKit

struct TableViewCellViewModel {
    let name: String
    let number: String
    let skills: [String]
}

class TableViewCell: UITableViewCell {
    // MARK: - Screen Elements
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    
    // MARK: - PROPERTIES
    static let id = "TableViewCell"
    
    func configure(with viewModel: TableViewCellViewModel) {
        var employeeSkills = ""
        for skill in viewModel.skills {
            employeeSkills += skill
        }
        nameLabel.text = viewModel.name
        numberLabel.text = viewModel.number
        skillsLabel.text = employeeSkills
    }
}
