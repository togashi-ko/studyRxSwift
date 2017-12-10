//
//  SelectActionView.swift
//  StudyRxSwift
//
//  Created by 冨樫公一 on 2017/12/03.
//  Copyright © 2017年 冨樫公一. All rights reserved.
//

import UIKit

protocol SelectActionViewDelegate {
    func removeAction()
    func addAction()
}

class SelectActionView: UIView {

    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var actionListTableView: UITableView!
    var delegate: SelectActionViewDelegate?

    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        let view = Bundle.main.loadNibNamed("SelectActionView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBAction func tapRemoveActionButton(_ sender: UIButton) {
        self.delegate?.removeAction()
    }

    @IBAction func tapAddActionButton(_ sender: UIButton) {
        self.delegate?.addAction()
    }
}
