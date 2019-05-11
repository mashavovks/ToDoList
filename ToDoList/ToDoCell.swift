//
//  ToDoCell.swift
//  ToDoList
//
//  Created by student15 on 4/21/19.
//  Copyright © 2019 student15. All rights reserved.
//

import UIKit

@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    //let toDoCell = ToDoCell.self
    var delegate: ToDoCellDelegate?
    //delegate property to the cell
    
    
    @IBOutlet weak var isCompleteButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    

    @IBAction func completeButtonTapped() {
        delegate?.checkmarkTapped(sender: self)
    }//action is called when the checkmark button is tapped. then passes the cell to the delegate. Then informs the delegate the button tapped has occured passing in self as the parameter to the method.
    
}
