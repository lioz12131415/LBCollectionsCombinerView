//
//  TagsCollectionVC.swift
//  LBCollectionsCombinerViewExample
//
//  Created by ליעוז בלקי on 22/11/2023.
//

import UIKit
import LBCollectionsCombinerView

class TagsCollectionVC: LBCombinerCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*  */
    }
    
    internal static func instance() -> TagsCollectionVC {
        let storyboard = UIStoryboard(name: "Tags", bundle: nil)
        let collection = storyboard.instantiateInitialViewController() as! TagsCollectionVC
        return collection
    }
}

extension TagsCollectionVC {
    // ================================================= //
    // MARK: -
    // ================================================= //
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        return cell
    }
}

extension TagsCollectionVC: UICollectionViewDelegateFlowLayout {
    // ========================================================= //
    // MARK: -
    // ========================================================= //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout)
        
        let l   = flowLayout.sectionInset.left
        let r   = flowLayout.sectionInset.right
        let w   = collectionView.frame.width-(l+r)
        let mis = flowLayout.minimumInteritemSpacing
        
        return .init(width:  (w/3)-((2.0/3.0)*mis),
                     height: (w/3)-((2.0/3.0)*mis))
    }
}
