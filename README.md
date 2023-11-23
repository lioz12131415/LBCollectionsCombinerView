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

### Collections Combiner View ###

- Collections Combiner View UI - The Collections Combiner View UI Design Most Be Storyboard Controller Sub View.
- Collections Combiner View Code - The Collections Combiner View Can Be Use as Reference Outlet To Parent View Controller.
- Collections Combiner View Inspectables - The Collections Combiner View UI Design Come With Inspectables Properties (minusScroll, headerHeight, headerNibName, isScrollEnable, adjustmentBehavior).

<p float="center">
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/collections_combiner_view_subview.png" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/collections_combiner_view_inspectables.png" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/collections_combiner_view_custom_class.png" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/collections_combiner_view_reference_outlet.png" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/collections_combiner_view_code.png" width="210" /> 
</p>

### Header ###

- Header UI - The Header UI Design Most Be In Nib File 
- Header View Class - The Header View Class Most Be Of Type `LBCollectionsCombinerHeaderView`.

<p float="center">
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/header.png" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/header_files.png" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/header_view.png" width="210" /> 
</p>

### Collection View Controller Page ###
- Collection View Controller Page UI - The StoryBoard Controller Of The Collection Page UI Design Most Be `CollectionViewController`
- Collection View Controller Page Class - The Collection View Controller Page Class Most Be Of Type `LBCombinerCollectionViewController`

<p float="center">
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/collection_view_controller.png" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/collection_view_controller_objc.png" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/Images/collection_view_controller_page.png" width="210" /> 
</p>

<br>

# ARC Design #

```swift
+----------------------+
| Header Inspectable's |
+----------------------+
| minusScroll          |
+----------------------+
| headerHeight         |
+----------------------+
| headerNibName        |
+----------------------+
    |
    |
+-----------------+          +----------------------------+
|   | Collections | <-+----- | Collections Combiner View  |
|   | Combiner    |          | Parent Controller Sub View |
|   v View        |          +----------------------------+
|  +-----------+  |
|  |           |  |
|  |   Header  |  |
|  |           |  |
|  +-----------+  |
|  +-----------+  | +-----------+  +-----------+          +---------------------------------+
|  |           |  | |           |  |           | <-+----- | Collection View Controller Page |
|  |           |  | |           |  |           |          +---------------------------------+
|  |           |  | |           |  |           |
|  |     A     |  | |     B     |  |     C     |
|  |    Page   |  | |    Page   |  |    Page   |
|  |           |  | |           |  |           |
|  |           |  | |           |  |           |
|  +-----------+  | +-----------+  +-----------+
+-----------------+

```

<br>

# Install #
The recommended approach for installing LBCollectionsCombinerView is the CocoaPods package manager.

Install CocoaPods if not already available:
```
$ sudo gem install cocoapods
```

Edit your Podfile and add LBCollectionsCombinerView:
```
platform :ios, '14.0'
use_frameworks!

target 'MyApp' do
  pod 'LBCollectionsCombinerView'
end
```

Install into your project:
```
$ pod install
```

# Requirements #
LBCollectionsCombinerView requires at least iOS 14 or above.
