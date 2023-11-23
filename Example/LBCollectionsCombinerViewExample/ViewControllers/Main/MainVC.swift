//
//  MainVC.swift
//  LBCollectionsCombinerViewExample
//
//  Created by ליעוז בלקי on 22/11/2023.
//

import UIKit
import LBCollectionsCombinerView

class MainVC: UIViewController {

    @IBOutlet weak var combinerView: LBCollectionsCombinerView!
    
    internal lazy var tags   = TagsCollectionVC.instance()
    internal lazy var videos = VideosCollectionVC.instance()
    internal lazy var images = ImagesCollectionVC.instance()
    
    internal var header: HeaderView? {
        return combinerView.header as? HeaderView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        combinerView.delegate   = self
        combinerView.dataSource = self
    }
}

extension MainVC: HeaderViewDelegate {
    // ================================================== //
    // MARK: -
    // ================================================== //
    func change(didSelected index: Int) {
        combinerView.setCurrentIndex(index)
    }
}

extension MainVC: LBCollectionsCombinerViewDelegate {
    // ================================================== //
    // MARK: -
    // ================================================== //
    func combinerView(_ combinerView: LBCollectionsCombinerView, didChangePage index: Int) {
        header?.selected(index)
    }
    
    func combinerView(_ combinerView: LBCollectionsCombinerView, didLoadHeader view: LBCollectionsCombinerHeaderView) {
        header?.delegate = self
    }
}

extension MainVC: LBCollectionsCombinerViewDataSource {
    // ================================================== //
    // MARK: -
    // ================================================== //
    func numberOfPages(_ combinerView: LBCollectionsCombinerView) -> Int {
        return 3
    }
    
    func combinerView(_ combinerView: LBCollectionsCombinerView, 
                      pageForItemAt indexPath: IndexPath) -> LBCombinerCollectionViewController? {
        switch indexPath.row {
            case 0: return images
            case 1: return videos
            case 2: return tags
        default:
            return nil
        }
    }
}
