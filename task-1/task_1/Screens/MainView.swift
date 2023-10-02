//
//  MainView.swift
//  task_1
//
//  Created by Жека on 29/09/2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    var firstElementView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemPurple
        return view
    }()
    
    var secondElementView: UIView = {
        var view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    var thirdElementView: UIView = {
        var view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var mainButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [firstElementView, secondElementView, thirdElementView, mainButton])
        stack.axis = .vertical
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.black.cgColor
        stack.spacing = 25 // offset между элементами - 25
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)// inset в контейнере - 10
        return stack
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
        self.addSubview(stackView)
    }
    
    func setupConstraints(){
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(self) // Отцентровка по вертикали
            make.left.right.equalTo(self).inset(10)
        }
        //Высота каждого элемента - 50
        firstElementView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        secondElementView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        thirdElementView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        mainButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
    }
}

