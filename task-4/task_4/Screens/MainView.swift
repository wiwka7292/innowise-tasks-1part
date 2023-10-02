//
//  MainView.swift
//  task_4
//
//  Created by Жека on 29/09/2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    var mainSquareView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 68/255, blue: 51/255, alpha: 1.0)
        return view
    }()
    
     var centralSquareView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 160/255, green: 105/255, blue: 198/255, alpha: 1.0)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    
    lazy var topLeftSquare: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 164/255, green: 203/255, blue: 63/255, alpha: 1.0)
        return view
    }()
    
    lazy var bottomLeftSquareView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 93/255, green: 178/255, blue: 224/255, alpha: 1.0)
        return view
    }()
    
    lazy var topRightSquareView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    lazy var topRightSmallSquareView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 239/255, green: 142/255, blue: 52/255, alpha: 1.0)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        backgroundColor = .white
    }
    
    func setupViews(){
        self.addSubview(mainSquareView)
        self.addSubview(centralSquareView)
        self.addSubview(topLeftSquare)
        self.addSubview(bottomLeftSquareView)
        self.addSubview(topRightSquareView)
        self.addSubview(topRightSmallSquareView)
    }
    
    func setupConstraints(){
        mainSquareView.snp.makeConstraints { make in
            make.top.left.equalTo(self.safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.33) // Высота 33 процента от экрана
            make.width.equalToSuperview().multipliedBy(0.66) // Ширина 66 процентов от экрана
        }
        
        centralSquareView.snp.makeConstraints { make in
            make.center.equalTo(mainSquareView)
            make.height.equalTo(mainSquareView).multipliedBy(0.2) // Высота 20 процентов от главного View
            make.width.equalTo(mainSquareView).multipliedBy(0.2)
        }
        
        topLeftSquare.snp.makeConstraints { make in
            make.left.top.equalTo(mainSquareView)
            make.height.equalTo(mainSquareView).multipliedBy(0.2) // Высота 20 процентов от главного View
            make.width.equalTo(mainSquareView).multipliedBy(0.2)
        }
        
        bottomLeftSquareView.snp.makeConstraints { make in
            make.left.bottom.equalTo(mainSquareView)
            make.height.equalTo(mainSquareView).multipliedBy(0.2) // Высота 20 процентов от главного View
            make.width.equalTo(mainSquareView).multipliedBy(0.2)
        }
        topRightSquareView.snp.makeConstraints { make in
            make.right.top.equalTo(mainSquareView)
            make.height.equalTo(mainSquareView).multipliedBy(0.2) // Высота 20 процентов от главного View
            make.width.equalTo(mainSquareView).multipliedBy(0.2)
        }
        topRightSmallSquareView.snp.makeConstraints { make in
            make.right.top.equalTo(mainSquareView)
            make.height.equalTo(topRightSquareView).multipliedBy(0.5) // Высота 50 процентов от маленького View
            make.width.equalTo(topRightSquareView).multipliedBy(0.5)
        }
    }
    
}
