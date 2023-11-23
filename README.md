# LBCollectionsCombinerView
This library provides a custom option to combain UICollectionViewControllers to one Scroll. Provides a simple API to manage multiple collection view controllers.

<br>

|Storyboard Setup:|
|:---|
|<p> <img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/setup.png" width="400" /> </p>|

<br>

|Storyboard Inspectable's:|
|:---|
|<p> <img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/inspectable.png" width="400" /> </p>|

## Example Project 

<p float="center">
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Gifs/screen_snapshot.gif" width="210" height="447" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/screen_snapshot.jpg" width="210" height="447" />
</p>


## Inspectable's

- minusScroll - A CGFloat Value That Determines The Point To Stop The Header Scroll And Make It Sticky.
- headerHeight - A CGFloat Value That Determines The Header Height.
- headerNibName - A String Value That Loaded The Header From The Nib File.
- isScrollEnable - A Boolean Value That Determines If The Pager Scrolling Is Enabled.
- adjustmentBehavior - A Boolean Value That Determines If Scrolls Adjustment Behavior Is Enabled.


## Delegate - LBCollectionsCombinerViewDelegate
### The Combiner View Delegate Methods.

```swift 
@objc public protocol LBCollectionsCombinerViewDelegate {

    /*
     * Did Change The Combiner View Current Page
     * */
     optional func combinerView(_ combinerView: LBCollectionsCombinerView, didChangePage index: Int)
     
    /*
     * Did Load The Combiner View Header
     * */
     optional func combinerView(_ combinerView: LBCollectionsCombinerView, didLoadHeader view: LBCollectionsCombinerHeaderView)
}
```

## DataSource - LBCollectionsCombinerViewDataSource
### The Combiner View Data Source Methods.

```swift 
@objc public protocol LBCollectionsCombinerViewDataSource {

    /*
     * The Combiner View Number Of Pages
     * */
    func numberOfPages(_ combinerView: LBCollectionsCombinerView) -> Int
    
    /*
     * The Combiner View Page For Item At Index Path
     * */
    func combinerView(_ combinerView: LBCollectionsCombinerView, pageForItemAt indexPath: IndexPath) -> LBCombinerCollectionViewController?
}
```

## Public Variables - LBCollectionsCombinerView
### The Combiner View Public Variables.

```swift  
    /*
     * The Combiner View Loaded Hedaer View From The Nib File
     * */
    open var header: _LBCollectionsCombinerHeaderView?
    
    /*
     * Type Casting Example 
     * */
    internal var header: HeaderView? {
        return combinerView.header as? ${ YOUR HEADER TYPE }
    }
    
    /*
     * The Combiner View Refresh Control ${ GET & SET VARIBLE }
     * */
    open var refreshControl: UIRefreshControl?
    
    /*
     * Set Example 
     * */
    combinerView.refreshControl = .refreshControl { CREATE YOUR Refresh Control VIEW }
```

## Public Methods - LBCollectionsCombinerView
### The Combiner View Public Methods.

```swift  
    /*
     * Change The Combiner View Current Page To Selected Index
     * */
    open func setCurrentIndex(_ index: Int)
    
    /*
     * Set Example 
     * */
    combinerView.setCurrentIndex(${ YOUR SELECTED INDEX })
```

<br>

## Implementation ##

### Header ###

- Header UI - The Header UI Design Most Be In Nib File 
- Header View Class - The Header View Class Most Be Of Type `LBCollectionsCombinerHeaderView`.

<p float="center">
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/header.png" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/header_files.png" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/header_view.png" width="210" /> 
</p>

