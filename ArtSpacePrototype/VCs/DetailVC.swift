//
//  DetailVC.swift
//  ArtSpacePrototype
//
//  Created by Kary Martinez on 1/27/20.
//  Copyright © 2020 God. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ArtDetailVC: UIViewController {
    
    // MARK: UI Objects
    lazy var imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: 400)
        
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 3), collectionViewLayout: layout)
        //        cv.delegate = self
        //        cv.dataSource = self
        //        cv.register(ItemImageCollectionViewCell.self, forCellWithReuseIdentifier: "imageCell")
        cv.isPagingEnabled = true
        return cv
    }()
    
    lazy var SizeName: UILabel = {
        let label = UILabel()
        label.text = "SIZE:"
        label.textColor = .black
        view.addSubview(label)
        return label
    }()
    

    
    lazy var ArtistName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    
    lazy var PriceName: UILabel = {
        let label = UILabel()
       
        return label
    }()
    
    
    lazy var PriceButton: UIButton = {
        let button = UIButton()
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PriceTapped())
//        view.addGestureRecognizer(tapGesture)
        button.addTarget(self, action: #selector(PriceTapped), for: .touchUpInside)

        return button
    }()
    
    @objc func PriceTapped() {
        print("Purchased")
        //      let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        //
    }
    
    
    lazy var ARButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        view.backgroundColor = .white
           addSubviews()
           applyAllConstraints()
       }
    
    
    
    //MARK: Private functions
    private func addSubviews() {
        view.addSubview(imageCollectionView)
        view.addSubview(SizeName)
        view.addSubview(PriceButton)
        
    }
    
    
    private func applyAllConstraints() {
        setupConst()
        constrainImageCollectionView()
        constrainPriceButton()
    }
    
    
    // MARK: Constraints
    
    private func setupConst() {
        
        SizeName.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(150)
            make.top.equalToSuperview().offset(200)
            make.size.equalTo(CGSize(width: 200, height: 20))
        }
        
    }
    private func constrainImageCollectionView() {
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            imageCollectionView.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.height / 3)
        ])
    }
}

private func constrainPriceButton() {
   

  }



extension ArtDetailVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
}
 
