//
//  ViewController.swift
//  task_3
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


}

