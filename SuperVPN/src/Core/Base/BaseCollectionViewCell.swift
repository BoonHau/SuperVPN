//
//  BaseCollectionViewCell.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit


class BaseCollectionViewCell: UICollectionViewCell {
    
    
    // A static fucntion to automatically register cell
    static func register(to collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: String(describing: Self.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Self.self))
    }
    
    
    // A static function to get registed cell
    static func dequeueCell(from collectionView: UICollectionView, indexPath: IndexPath) -> BaseCollectionViewCell? {
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as? BaseCollectionViewCell
    }
    
}
