//
//  CollectionViewController.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import UIKit
import Kingfisher

class CollectionViewController: UIViewController {

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = CollectionViewModel()
    private var items: [CollectionCellViewModel] = []
    var tempItem: [CollectionCellViewModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        
    }
}

extension CollectionViewController: CollectionViewModelProtocol {
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    func didCellImageFetch(_ items: [CollectionCellViewModel]) {
        self.items = items
        var i = 0
        while i<100 {
            tempItem.append(items[i])
            i = i+1
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}



private extension CollectionViewController {
    func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempItem.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        
        cell.imageView.kf.setImage(with: URL(string: tempItem[indexPath.row].Image))
        cell.imageView.layer.cornerRadius = 8
        return cell
    }
}
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
}
 
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
    let widthPerItem = collectionView.frame.width / 3 - gridLayout.minimumInteritemSpacing
    return CGSize(width:widthPerItem, height:150)
    
}
}
