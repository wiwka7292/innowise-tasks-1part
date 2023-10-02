//
//  ViewController.swift
//  task_2
//
//  Created by Жека on 29/09/2023.
//

import UIKit

class MainVC: UIViewController {
    
    var mainView: MainView { view as! MainView}
    
    override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if mainView.scrollView.contentSize.height > mainView.scrollView.bounds.height {
            // Scroll включен
            mainView.mainButton.snp.makeConstraints { make in
                make.left.right.equalTo(view).inset(40)
                make.height.equalTo(50)
                make.bottom.equalTo(mainView.stackView.snp.bottom)
            }
        } else {
            // Scroll выключен
            mainView.mainButton.snp.makeConstraints { make in
                make.left.right.equalTo(view).inset(40)
                make.height.equalTo(50)
                make.bottom.equalTo(view).inset(60)
            }
        }
    }
    
}

