//
//  ContentListCell.swift
//  Goal
//
//  Created by RAjeev Singh on 27/09/21.
//

import UIKit

class ContentListCell: UITableViewCell {

    @IBOutlet weak var lblTitle     : UILabel!
    @IBOutlet weak var lblSubTitle  : UILabel!
    @IBOutlet weak var lblDate      : UILabel!
    
    var item : Items?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lblTitle.text = item?.title
        lblSubTitle.text = item?.subtitle
        lblDate.text = item?.date
    }

}
