//
//  UIViewController+Charleene.h
//  Charleene
//
//  Created by Kersten Broich on 23/06/15.
//  Copyright (c) 2015 Kersten Broich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Charleene.h"

@interface UIViewController (Charleene)

- (void)presentCharleeneModally:(UIViewController*)viewControllerToPresent transitionMode:(KSModalTransitionMode)mode;

- (void)dismissCharleeneAnimated:(BOOL)animated completion:(void(^)(void))completion;

@end
