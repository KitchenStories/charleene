//
//  ModalCenterContentViewController.h
//  Kitchen Stories
//
//  Created by Kersten Broich on 06/05/15.
//  Copyright (c) 2015 Kitchen Stories. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KSModalTransitionMode) {
    KSModalTransitionModeFromBottom = 0,
    KSModalTransitionModeFromTop,
    KSModalTransitionModeFromLeft,
    KSModalTransitionModeFromRight,
};

@interface Charleene : UIViewController

- (void)dismissViewControllerWithCompletion:(void(^)())completion;

/* Note that this property is ignored on the iPad as Charleene uses the default iOS iPad Form Sheet animation */
@property (nonatomic, assign) KSModalTransitionMode transitionMode;

/* Set the containing view controller - if you need communication between containing view controller and callers of Charleene best approach is the delegate pattern */
@property (nonatomic) UIViewController *containingViewController;

@end
