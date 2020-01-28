//
//  HomePageVC.swift
//  ArtSpacePrototype
//
//  Created by God on 1/21/20.
//  Copyright © 2020 God. All rights reserved.
//

import UIKit
import SnapKit

class HomePageVC: UIViewController {
  
  //MARK: -- Properties
  var arrayOfImages = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9"),UIImage(named: "10")]
  
  var artObjectData = [ArtObject]() {
    didSet {
      self.artCollectionView.reloadData()
    }
  }
  
  //MARK: -- UIObjects
  lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "Search"
    return searchBar
  }()
  
  lazy var filterButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
    
    return button
  }()
  
  lazy var mapView: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "map"), for: .normal)
    return button
  }()
  
  lazy var artCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout.init()
    let cv = UICollectionView(frame:.zero , collectionViewLayout: layout)
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: 250, height: 250)
    cv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    cv.register(ArtCell.self, forCellWithReuseIdentifier: "artCell")
    cv.delegate = self
    cv.dataSource = self
    return cv
  }()
  
  //MARK: -- Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = true
    self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    [searchBar, filterButton, mapView,artCollectionView].forEach({self.view.addSubview($0)})
    setUpConst()
    getArtPosts()
  }
  
  //MARK: -- Private Methods
  private func getArtPosts() {
    FirestoreService.manager.getAllArtObjects { (result) in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let artFromFirebase):
        DispatchQueue.main.async {
          self.artObjectData = artFromFirebase
          dump(artFromFirebase)
        }
      }
    }
  }
  
  //MARK: -- Constraints
  func setUpConst() {
    searchBar.snp.makeConstraints { make in
      make.width.equalTo(200)
      make.top.equalTo(self.view).offset(75)
      make.left.equalTo(self.view).offset(100)
    }
    
    filterButton.snp.makeConstraints { make in
      make.top.equalTo(searchBar)
      make.right.equalTo(searchBar).offset(50)
    }
    
    mapView.snp.makeConstraints { make in
      make.top.equalTo(searchBar)
      make.left.equalTo(searchBar).offset(-50)
    }
    
    artCollectionView.snp.makeConstraints { make in
      make.top.equalTo(self.view).offset(150)
      make.left.equalTo(self.view)
      make.bottom.equalTo(self.view)
      make.right.equalTo(self.view)
    }
    
  }
}

//MARK: -- Extensions
extension HomePageVC: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrayOfImages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = artCollectionView.dequeueReusableCell(withReuseIdentifier: "artCell", for: indexPath) as? ArtCell else {return UICollectionViewCell()}
    
    let currentImage = arrayOfImages[indexPath.row]
    cell.imageView.image = currentImage!
    return cell
  }
}

extension HomePageVC: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let detailVC = ArtDetailVC()
    self.navigationController?.pushViewController(detailVC, animated: true)
  }
}

extension HomePageVC: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: 200)
  }
}
