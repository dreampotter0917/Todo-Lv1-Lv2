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
    
    func setCell(title: String, content: String, deadline: Date){
        titleLabel.text = title
        contentLabel.text = content
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'年'M'月'd'日('EEEEE') '"
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        let deadline = dateFormatter.string(from: deadline)

        
        deadlineLabel.text = deadline
        
        
        
    }
    
}
