//
//  MainView.swift
//  task_3
//
//  Created by Жека on 29/09/2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    var firstObjectView: UIView = {
        var view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var secondObjectView: UIView = {
        var view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    var thirdObjectView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemIndigo
        return view
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [firstObjectView, secondObjectView, thirdObjectView])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
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
    
    func setupViews() {
        self.addSubview(stackView)
    }
    
    var heightObjects = UIScreen.main.bounds.height // Берем высоту экрана
    
    func setupConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
        

        firstObjectView.snp.makeConstraints { make in
            make.width.equalTo(110)
            make.height.equalTo(heightObjects * 0.5) // 50 процентов от высоты экрана
        }
        
        secondObjectView.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(heightObjects * 0.85) // 85 процентов от высоты экрана
        }
        
        thirdObjectView.snp.makeConstraints { make in
            make.width.equalTo(110)
            make.height.equalTo(heightObjects * 0.80) // 80 процентов от высоты экрана
        }
        
    }
}
