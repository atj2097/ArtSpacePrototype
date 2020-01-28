//
//  ArtCell.swift
//  ArtSpacePrototype
//
//  Created by God on 1/27/20.
//  Copyright © 2020 God. All rights reserved.
//

import UIKit
import SnapKit
class ArtCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    lazy var priceLabel: UILabel = {
        var label = UILabel()
        label.text = "$50"
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.layer.cornerRadius = CGFloat(integerLiteral: 50)
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    addConst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConst() {
        contentView.addSubview(imageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(likeButton)
        imageView.snp.makeConstraints{ make in
            make.top.equalTo(contentView)
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.bottom.equalTo(contentView)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.right.equalTo(contentView).offset(-5)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(30)
            make.right.equalTo(contentView).offset(-5)
        }
        
        
    }
    
}
