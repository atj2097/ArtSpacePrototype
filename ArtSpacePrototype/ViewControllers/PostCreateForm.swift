//
//  PostCreateForm.swift
//  ArtSpacePrototype
//
//  Created by God on 1/28/20.
//  Copyright © 2020 God. All rights reserved.
//

import UIKit
import SnapKit
import Photos
import AssetsLibrary

class PostCreateForm: UIViewController {
    var image = UIImage() {
        didSet {
            self.artImage.image = image
        }
    }
    lazy var uploadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(pickPhoto), for: .touchUpInside)
        return button
    }()
    
    
    lazy var postArtLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Post Your Art"
        label.font = UIFont(name: "Avenir-Next", size: 30)
        return label
    }()
    lazy var artTitle: UITextField = {
        let input = UITextField()
        input.textAlignment = .center
        input.placeholder = "Name Of Art"
        return input
    }()
    
    lazy var artPrice: UITextField = {
        let price = UITextField()
        price.textAlignment = .center
        price.placeholder = "Price"
        return price
    }()
    
    lazy var postButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Post", for: .normal)
        button.addTarget(self, action: #selector(postArt), for: .touchUpInside)
        return button
    }()
    
    lazy var artImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "icloud.and.arrow.down.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.tintColor = .black
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
                button.imageEdgeInsets = UIEdgeInsets(top: 25,left: 25,bottom: 25,right: 25)
        button.addTarget(self, action: #selector(transitionOut), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
[postArtLabel,artImage,artPrice,artTitle,postButton,cancelButton,uploadButton].forEach({self.view.addSubview($0)})
        setUpConstraints()
    }
    
    @objc func transitionOut() {
        let prevVC = HomePageVC()
        prevVC.modalPresentationStyle = .fullScreen
        self.present(prevVC, animated: true, completion: nil)
    }
    @objc func postArt() {
        showAlert(with: "Art Posted", and: "Now available for Sale!")
    }
    
    @objc func pickPhoto() {
        let imagePickerVC = UIImagePickerController()
               imagePickerVC.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
               present(imagePickerVC, animated: true)
    }
    
    private func showAlert(with title: String, and message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(alert: UIAlertAction!) in
            let prevVC = HomePageVC()
                   prevVC.modalPresentationStyle = .fullScreen
                   self.present(prevVC, animated: true, completion: nil)
        }))
        present(alertVC, animated: true, completion: nil)
    }
    
    func setUpConstraints() {
         cancelButton.snp.makeConstraints { make in
                   make.width.equalTo(75)
                   make.top.equalTo(self.view).offset(75)
                   make.left.equalTo(self.view).offset(15)
               }
        postArtLabel.snp.makeConstraints{ make in
            make.top.equalTo(cancelButton)
            make.left.equalTo(artPrice)
            
        }
        artTitle.snp.makeConstraints{ make in
            make.top.equalTo(cancelButton).offset(75)
            make.left.equalTo(cancelButton).offset(75)
        }
        
        artPrice.snp.makeConstraints { make in
            make.top.equalTo(artTitle).offset(100)
            make.left.equalTo(artTitle)
            
        }
        
        artImage.snp.makeConstraints{ make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.center.equalTo(self.view)
        }
        
        uploadButton.snp.makeConstraints{ make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.center.equalTo(self.view)
        }
        
        
        postButton.snp.makeConstraints { make in
            make.top.equalTo(artImage).offset(300)
            make.left.equalTo(artTitle).offset(75)
            make.width.equalTo(100)
        }
    }
    

}
extension PostCreateForm: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        self.image = image
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            //MARK: TODO - gracefully fail out without interrupting UX
            return
        }
        
//        FirebaseStorageService.manager.storeUserInputImage(image: imageData, completion: { [weak self] (result) in
//            switch result{
//            case .success(let url):
//                //Note - defer UI response, update user image url in auth and in firestore when save is pressed
//                self?.imageURL = url
//            case .failure(let error):
//                print(error)
//            }
//        })
        dismiss(animated: true, completion: nil)
    }
}
