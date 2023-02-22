//
//  ItemTableViewCell.swift
//  Todo
//
//  Created by あらいゆめ on 2023/02/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var deadlineLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCell(title: String, content: String, deadline: String){
        titleLabel.text = title
        contentLabel.text = content
        deadlineLabel.text = deadline
        
    }
    
}
