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
    
    
    var currentImage: [UIImage]!
    // MARK: UI Objects
    lazy var imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: 300)

        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 3), collectionViewLayout: layout)
        //        cv.delegate = self
        //        cv.dataSource = self
        //        cv.register(ItemImageCollectionViewCell.self, forCellWithReuseIdentifier: "imageCell")
        cv.isPagingEnabled = true
        return cv
    }()
    
    lazy var SizeName: UILabel = {
        let label = UILabel()
        label.text = "Size:"
        label.textColor = .black
        view.addSubview(label)
        return label
    }()
    


    lazy var ArtistName: UILabel = {
        let label = UILabel()
        label.text = "Artist Name: "
          view.addSubview(label)
        return label
    }()


    
    
    lazy var PriceName: UILabel = {
        let label = UILabel()
        label.text = "$$"
        view.addSubview(label)
        return label
    }()
    lazy var ARlogo: UIImageView = {
          let Imagelogo = UIImageView()
        Imagelogo.image = #imageLiteral(resourceName: "2064275-200")
        view.addSubview(Imagelogo)
         Imagelogo.translatesAutoresizingMaskIntoConstraints = false
          return Imagelogo
      }()
    
    lazy var PriceButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("BUY NOW ", for: .normal)
        button.addTarget(self, action: #selector(PriceTapped), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()

    @objc func PriceTapped() {

        let alertPopup = UIAlertController(title: "Successful", message: "Thank you for your purchase!", preferredStyle: .alert)
          
          alertPopup.addAction(UIAlertAction(title: "okay", style: .default, handler: nil))
          
          self.present(alertPopup, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
           super.viewDidLoad()
        view.backgroundColor = .white
           addSubviews()
           applyAllConstraints()
       }
    
    
    
    //MARK: Private functions
    private func addSubviews() {
        view.addSubview(imageCollectionView)

        
    }
    
    
    private func applyAllConstraints() {
        constrainImageCollectionView()
        constrainSizelabel()
        constrainArtistlabel()
        constrainMoneylabel()
        BuyButtonConst()
        ARButtonConst()
    }
    
    
    // MARK: Constraints
    

    private func constrainImageCollectionView() {
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            imageCollectionView.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.height / 3)
        ])
    }


    
    private func constrainSizelabel() {
        SizeName.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(150)
                make.top.equalToSuperview().offset(400)
                make.size.equalTo(CGSize(width: 400, height: 40))
            }
}
    
        private func constrainArtistlabel() {
            ArtistName.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(150)
                    make.top.equalToSuperview().offset(450)
                    make.size.equalTo(CGSize(width: 400, height: 40))
                }
    }
    
    private func constrainMoneylabel() {
        PriceName.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(150)
            make.top.equalToSuperview().offset(500)
            make.size.equalTo(CGSize(width: 400, height: 40))
        }
    }
    
    
    private func  BuyButtonConst() {
        PriceButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(600)
            make.size.equalTo(CGSize(width: 350, height: 40))
        }
    }
    
    private func  ARButtonConst() {
         ARlogo.snp.makeConstraints { (make) in
             make.left.equalToSuperview().offset(20)
             make.top.equalToSuperview().offset(650)
             make.size.equalTo(CGSize(width: 100, height: 50))
         }
     }
    
}

extension ArtDetailVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }

}
 

