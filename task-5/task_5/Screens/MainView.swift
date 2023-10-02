//
//  MainView.swift
//  task_5
//
//  Created by Жека on 01/10/2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemsCount: CGFloat = 14
        let padding: CGFloat = 0
        let paddingCount: CGFloat = itemsCount
        let paddingSize = paddingCount * padding
        layout.minimumLineSpacing = -15
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: 30, height: 30)
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UserRecommendsCell.self, forCellWithReuseIdentifier: UserRecommendsCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.allowsFocus = false
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    var othersRecommendUsers: UIButton = {
        var button = UIButton()
        button.tintColor = .gray
        button.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.setTitle("+36", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.contentMode = .scaleToFill
        let width = UIScreen.main.bounds.width
        button.heightAnchor.constraint(equalToConstant: 0.08 * width).isActive = true
        button.widthAnchor.constraint(equalToConstant: 0.08 * width).isActive = true
        return button
    }()
    
    lazy var recommendUsersLabel: UILabel = {
        var label = UILabel()
//        label.text = "\(recommendUsers) / \(numberOfUsers) users"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Model winner of 2018 Tokyo Art costume design week"
        label.font = UIFont.systemFont(ofSize: 27)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    var backgroundView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    var profileIconView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "person.circle")
        image.tintColor = .white
        image.clipsToBounds = true
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.15 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.15 * width).isActive = true
        return image
    }()
    
    var onlineStatusLabel: UILabel = {
        var label = UILabel()
        label.text = "6 Days Ago"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    var profileNameLabel: UILabel = {
        var label = UILabel()
        label.text = "Izabella Zhang"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    var followButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("+Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.contentEdgeInsets = UIEdgeInsets(top: 7, left: 23, bottom: 7, right: 23)
        return button
    }()
    
    var lineView: UIView = {
        var view = UIView()
        view.backgroundColor = .darkGray.withAlphaComponent(0.5)
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        return view
    }()
    
    var recommendLable: UILabel = {
        var label = UILabel()
        label.text = "Recommended by :"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    
    lazy var userViewsButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.imageView?.tintColor = .systemGray2
        button.imageView?.contentMode = .scaleAspectFit
//        button.setTitle("\(postViews)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        return button
    }()
    
    lazy var userCommentsButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.imageView?.tintColor = .systemGray2
        button.imageView?.contentMode = .scaleAspectFit
//        button.setTitle("\(postComments)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        return button
    }()
    
    lazy var userLikesButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.imageView?.tintColor = .systemGray2
        button.imageView?.contentMode = .scaleAspectFit
//        button.setTitle("\(postLikes)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        return button
    }()
    
    
    lazy var statisticStackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [userViewsButton, userCommentsButton, userLikesButton])
        stack.axis = .horizontal
        stack.spacing = 15
        return stack
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

}


//Constraints
extension MainView{
    
    func setupViews(){
        
        self.addSubview(backgroundView)
        self.addSubview(titleLabel)
        self.addSubview(profileIconView)
        self.addSubview(profileNameLabel)
        self.addSubview(followButton)
        self.addSubview(lineView)
        self.addSubview(onlineStatusLabel)
        self.addSubview(recommendLable)
        self.addSubview(recommendUsersLabel)
        self.addSubview(statisticStackView)
        self.addSubview(collectionView)
        self.addSubview(othersRecommendUsers)
    }
    
    func setupConstraints(){
        backgroundView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.bottom.equalTo(self).inset(300)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self).inset(20)
            make.right.equalTo(self).inset(50)
            make.bottom.equalTo(backgroundView).offset(50)
        }
        
        profileIconView.snp.makeConstraints { make in
            make.left.equalTo(self).inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            
        }
        
        profileNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileIconView.snp.bottom).inset(50)
            make.left.equalTo(profileIconView.snp.right).offset(10)
        }
        
        onlineStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(profileNameLabel.snp.bottom).offset(5)
            make.left.equalTo(profileIconView.snp.right).offset(10)
        }
        
        followButton.snp.makeConstraints { make in
            make.right.equalTo(self).inset(20)
            make.bottom.equalTo(profileIconView.snp.bottom).inset(12)
        }
        
        lineView.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(20)
            make.top.equalTo(profileIconView.snp.bottom).offset(30)
        }
        recommendLable.snp.makeConstraints { make in
            make.left.equalTo(self).inset(20)
            make.top.equalTo(lineView.snp.bottom).offset(20)
        }
        recommendUsersLabel.snp.makeConstraints { make in
            make.right.equalTo(self).inset(20)
            make.bottom.equalTo(recommendLable.snp.bottom)
        }
        statisticStackView.snp.makeConstraints { make in
            make.right.equalTo(self).inset(20)
            make.top.equalTo(recommendUsersLabel.snp.bottom).offset(15)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(recommendLable.snp.bottom).offset(15)
            make.left.equalTo(self).inset(20)
            make.bottom.equalTo(self).inset(60)
            make.right.equalTo(self).inset(200)
        }
        
        othersRecommendUsers.snp.makeConstraints { make in
            make.left.equalTo(collectionView.snp.right).inset(115)
            make.bottom.equalTo(collectionView.snp.bottom).offset(2)
        }
    }
}


//CollectionView
extension MainView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserRecommendsCell.reuseId, for: indexPath) as! UserRecommendsCell
        
        return cell
    }
    
    
}
