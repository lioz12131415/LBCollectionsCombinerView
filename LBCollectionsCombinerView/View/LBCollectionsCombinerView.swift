//
//  LBCollectionsCombinerView.swift
//  LBCollectionsCombinerView
//
//  Created by ליעוז בלקי on 22/11/2023.
//

import Foundation
import _LBCollectionsCombinerViewXCFramework

open class LBCollectionsCombinerView: _LBCollectionsCombinerView {
    
    open weak var delegate: LBCollectionsCombinerViewDelegate? = nil {
        didSet { super._delegate = self }
    }
    
    open weak var dataSource: LBCollectionsCombinerViewDataSource? = nil {
        didSet { super._dataSource = self }
    }
    
    @IBInspectable open override var minusScroll: CGFloat {
        get { return super.minusScroll } set { super.minusScroll = newValue }
    }
    
    @IBInspectable open override var headerHeight: CGFloat {
        get { return super.headerHeight } set { super.headerHeight = newValue }
    }
    
    @IBInspectable open override var headerNibName: String {
        get { return super.headerNibName } set { super.headerNibName = newValue }
    }
    
    @IBInspectable open override var isScrollEnable: Bool {
        get { return super.isScrollEnable } set { super.isScrollEnable = newValue }
    }
    
    @IBInspectable open override var adjustmentBehavior: Bool  {
        get { return super.adjustmentBehavior } set { super.adjustmentBehavior = newValue }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    open override func setCurrentIndex(_ index: Int) {
        super.setCurrentIndex(index)
    }
}

extension LBCollectionsCombinerView: _LBCollectionsCombinerViewDelegate {
    // ============================================== //
    // MARK: -
    // ============================================== //
    public func combinerView(_ combinerView: _LBCollectionsCombinerView, 
                             didLoadHeader view: _LBCollectionsCombinerHeaderView) {
        guard let view = view as? LBCollectionsCombinerHeaderView else {
            return
        }
        delegate?.combinerView?(self, didLoadHeader: view)
    }
    
    public func combinerView(_ combinerView: _LBCollectionsCombinerView, didChangePage index: Int) {
        delegate?.combinerView?(self, didChangePage: index)
    }
}

extension LBCollectionsCombinerView: _LBCollectionsCombinerViewDataSource {
    // ============================================== //
    // MARK: -
    // ============================================== //
    public func numberOfPages(_ combinerView: _LBCollectionsCombinerView) -> Int {
        return dataSource?.numberOfPages(self) ?? .zero
    }
    
    public func combinerView(_ combinerView: _LBCollectionsCombinerView,
                             pageForItemAt indexPath: IndexPath) -> _LBCombinerCollectionViewController? {
        return dataSource?.combinerView(self, pageForItemAt: indexPath)
    }
}

@objc public protocol LBCollectionsCombinerViewDelegate {
    /* * * */
    /* * * */
    @objc optional func combinerView(_ combinerView: LBCollectionsCombinerView, didChangePage index: Int)
    /* * * */
    @objc optional func combinerView(_ combinerView: LBCollectionsCombinerView,
                                     didLoadHeader view: LBCollectionsCombinerHeaderView)
}

@objc public protocol LBCollectionsCombinerViewDataSource {
    /* * * */
    func numberOfPages(_ combinerView: LBCollectionsCombinerView) -> Int
    /* * * */
    func combinerView(_ combinerView: LBCollectionsCombinerView,
                      pageForItemAt indexPath: IndexPath) -> LBCombinerCollectionViewController?
}
