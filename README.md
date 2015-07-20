# Charleene

iOS - UIModalPresentationFormSheet for iPhone

[![CI Status](http://img.shields.io/travis/Kersten Broich/Charleene.svg?style=flat)](https://travis-ci.org/Kersten Broich/Charleene)
[![Version](https://img.shields.io/cocoapods/v/Charleene.svg?style=flat)](http://cocoapods.org/pods/Charleene)
[![License](https://img.shields.io/cocoapods/l/Charleene.svg?style=flat)](http://cocoapods.org/pods/Charleene)
[![Platform](https://img.shields.io/cocoapods/p/Charleene.svg?style=flat)](http://cocoapods.org/pods/Charleene)

![](https://github.com/KitchenStories/Charleene/blob/master/images/charleene-header.png)

Charleene is simple, modern and lightweight solution for porting the UIModalPresentationFormSheet (known as a system API feature on iPads) to iPhones.

Charleene takes any UIViewController as containing UIViewController and presents it modally. 

Of course you get an out-of-the box communication pattern back to your presenting view controller. Whenever Charleene is used on the iPad it uses the iOS system API for UIModalPresentationFormSheet.



## Demo

![](https://github.com/KitchenStories/Charleene/blob/master/images/Charleene-Demo.gif)


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Include

Include the corresponding category on UIViewController in your implementation file

```objc
#import <UIViewController+Charleene.h>
```

### Presentation

Usage is as simple as that:

From Storyboard:

````objc
ViewControllerOfYourChoice *vc = [[UIStoryboard storyboardWithName:@“Main” bundle:nil] instantiateViewControllerWithIdentifier:@“ViewControllerOfYourChoice”];
[self presentCharleeneModally:vc transitionMode:KSModalTransitionModeFromBottom];
```

From Code:

````objc  
ViewControllerOfYourChoice *vc = [[ViewControllerOfYourChoice alloc] init];    
[self presentCharleeneModally:vc transitionMode:KSModalTransitionModeFromBottom];

````

### Dismissal

Dismissal is as simple as calling the following method on any UIViewController

````objc
[self dismissCharleeneAnimated:YES completion:nil];
````


## Requirements

iOS7.x / iOS 8.x

## Installation

Charleene is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Charleene"
```

## Author

Kersten Broich, kersten.broich@kitchentories.de

## License

Charleene is available under the MIT license. See the LICENSE file for more info.
