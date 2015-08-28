//
//  UIViewController+Charleene.m
//  Charleene
//
//  Created by Kersten Broich on 23/06/15.
//  Copyright (c) 2015 Kersten Broich. All rights reserved.
//

#import "UIViewController+Charleene.h"

@implementation UIViewController (Charleene)

static Charleene *staticCharleene = nil;

- (void)presentCharleeneModally:(UIViewController*)viewControllerToPresent transitionMode:(KSModalTransitionMode)mode {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        viewControllerToPresent.modalPresentationStyle = UIModalPresentationFormSheet;
        [self presentViewController:viewControllerToPresent animated:YES completion:nil];
    }
    else {
#ifdef __IPHONE_7_0
        self.modalPresentationStyle = UIModalPresentationCurrentContext;
#endif
        NSBundle *bundle = [NSBundle bundleForClass:[Charleene class]];        
        Charleene *charleene = [[UIStoryboard storyboardWithName:@"Charleene" bundle:bundle] instantiateInitialViewController];
        charleene.containingViewController = viewControllerToPresent;
        charleene.transitionMode = mode;
        
        if (staticCharleene == nil) {
            staticCharleene = charleene;
            [self presentViewController:staticCharleene animated:NO completion:nil];
        }
    }
}

- (void)dismissCharleeneAnimated:(BOOL)animated completion:(void (^)(void))completion {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad || staticCharleene == nil) {
        [self dismissViewControllerAnimated:YES completion:completion];
        return;
    }
    
    if (staticCharleene) {
        [staticCharleene dismissViewControllerWithCompletion:^{
            if (completion) {
                completion();
            }
        }];
        
        staticCharleene = nil;
    }
}

@end
