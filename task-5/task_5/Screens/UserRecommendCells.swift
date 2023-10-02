//
//  UserRecommendCells.swift
//  task_5
//
//  Created by Жека on 02/10/2023.
//

import UIKit

class UserRecommendsCell: UICollectionViewCell {
    
    static var reuseId = "UserRecommendsCell"
    
    var userImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "person.circle.fill")
        image.tintColor = .systemBlue
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        self.addSubview(userImageView)
    }
    
    func setupConstraints(){
        userImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
