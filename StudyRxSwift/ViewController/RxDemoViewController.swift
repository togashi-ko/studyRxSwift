//
//  RxDemoViewController.swift
//  StudyRxSwift
//
//  Created by 冨樫公一 on 2017/11/24.
//  Copyright © 2017年 冨樫公一. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

class RxDemoViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func bind() {
        textField.rx.text                  // 4. rx_textは後述
            .map {"(入力確認:\(String(describing: $0)))"}                // 5. 変更があった要素に「」つけて
            .bind(to: textLabel.rx.text)         // 6. labelに反映
            .disposed(by: disposeBag)    // 7. 不要になったらunsubscribe
    }

}
