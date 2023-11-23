//
//  VideosCollectionVC.swift
//  LBCollectionsCombinerViewExample
//
//  Created by ליעוז בלקי on 22/11/2023.
//

import UIKit
import LBCollectionsCombinerView

class VideosCollectionVC: LBCombinerCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* * * */
    }
    
    internal static func instance() -> VideosCollectionVC {
        let storyboard = UIStoryboard(name: "Videos", bundle: nil)
        let collection = storyboard.instantiateInitialViewController() as! VideosCollectionVC
        return collection
    }
}

extension VideosCollectionVC {
    // ================================================= //
    // MARK: -
    // ================================================= //
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as! VideoCell
        return cell
    }
}

extension VideosCollectionVC: UICollectionViewDelegateFlowLayout {
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
                     height: ((w/3)-((2.0/3.0)*mis))*2)
    }
}
