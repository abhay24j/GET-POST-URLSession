//
//  UserTableViewCell.swift
//  NetworkingSession
//
//  Created by Abhishek Sinha on 01/05/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var emailId: UILabel!
    
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var status: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
