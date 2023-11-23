//
//  HeaderView.swift
//  LBCollectionsCombinerViewExample
//
//  Created by ליעוז בלקי on 22/11/2023.
//

import UIKit
import LBCollectionsCombinerView

class HeaderView: LBCollectionsCombinerHeaderView {
    
    @IBOutlet var iconsCollection: [UIImageView]!
    
    internal weak var delegate: HeaderViewDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /* * * */
    }
    
    internal func selected(_ index: Int) {
        iconsCollection.forEach {
            $0.tintColor = .lightGray
        }
        iconsCollection[index].tintColor = .white
    }
    
    /*
     * @IBActions
     * */
    @IBAction func tagsTouch(_ sender: UIButton) {
        delegate?.change(didSelected: 2)
        selected(2)
    }

    @IBAction func videosTouch(_ sender: UIButton) {
        delegate?.change(didSelected: 1)
        selected(1)
    }
    
    @IBAction func imagesTouch(_ sender: UIButton) {
        delegate?.change(didSelected: 0)
        selected(0)
    }
}

@objc protocol HeaderViewDelegate {
    /*
     * */
    func change(didSelected index: Int)
}

