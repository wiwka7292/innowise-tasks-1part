//
//  MainView.swift
//  task_2
//
//  Created by Жека on 29/09/2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    var scrollView: UIScrollView = {
        var scroll = UIScrollView()
        
        return scroll
    }()
    
    var mainButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    var firstObject: UIView = {
        var view = UIView()
        view.backgroundColor = .red
        
        // Чтоб выключить scroll
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Чтобы включить scroll
//                        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        return view
    }()
    
    var secondObject: UIView = {
        var view = UIView()
        view.backgroundColor = .yellow
        
        // Чтоб выключить scroll
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Чтобы включить scroll
//                        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        return view
    }()
    
    var emptyObject: UIView = {
        var view = UIView()
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [firstObject, secondObject, emptyObject])
        stack.axis = .vertical
        stack.spacing = 40
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        scrollView.addSubview(stackView)
        scrollView.addSubview(mainButton)
        self.addSubview(scrollView)
    }
    
    func setupConstraints(){
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(scrollView).inset(100)
            make.left.right.equalTo(self).inset(40)
            make.bottom.equalTo(scrollView)
        }
        
    }
}
