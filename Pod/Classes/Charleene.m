//
//  ModalCenterContentViewController.m
//  Kitchen Stories
//
//  Created by Kersten Broich on 06/05/15.
//  Copyright (c) 2015 Kitchen Stories. All rights reserved.
//

#import "Charleene.h"

@interface Charleene ()
@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *centerYAlignmentConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *centerXAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *animationConstraint;
@property (nonatomic, weak) IBOutlet UIView *backgroundView;
@property (nonatomic, assign) CGFloat constraintConstantVisible;
@property (nonatomic, assign) CGFloat constraintConstantHiddenBeforeAnimation;
@property (nonatomic, assign) CGFloat constraintConstantHiddenAfterAnimation;
@end

static const NSTimeInterval ModalCenterContentViewControllerAnimationDurationAppear = 0.3;
static const NSTimeInterval ModalCenterContentViewControllerAnimationDurationDisappear = 0.2;

#import "UIViewController+Charleene.h"

@implementation Charleene

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];        
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view layoutIfNeeded];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.backgroundView.alpha > 0) {
        return;
    }

    [self.view layoutIfNeeded]; // fix: layout the container view to prevent it's subviews getting animated
    
    self.backgroundView.alpha = 0.0;
    self.animationConstraint.constant = self.constraintConstantVisible;
    
    [UIView animateWithDuration:ModalCenterContentViewControllerAnimationDurationAppear delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backgroundView.alpha = 0.7;
        [self.view layoutIfNeeded];
    } completion:nil];    
}

#pragma mark - public API

- (void)setTransitionMode:(KSModalTransitionMode)transitionMode {
    
    self.constraintConstantVisible = 0;
    
    switch (transitionMode) {
            // Those cases always animating back where they came from
        case KSModalTransitionModeFromBottom:
            self.constraintConstantHiddenBeforeAnimation = self.view.frame.size.height * -1;
            self.centerYAlignmentConstraint.constant = self.constraintConstantHiddenBeforeAnimation;
            self.animationConstraint = self.centerYAlignmentConstraint;
            break;
        case KSModalTransitionModeFromTop:
            self.constraintConstantHiddenBeforeAnimation = self.view.frame.size.height;
            self.centerYAlignmentConstraint.constant = self.constraintConstantHiddenBeforeAnimation;
            self.animationConstraint = self.centerYAlignmentConstraint;
            break;
        case KSModalTransitionModeFromLeft:
            self.constraintConstantHiddenBeforeAnimation =  self.view.frame.size.width * -1;
            self.centerXAlignmentConstraint.constant = self.constraintConstantHiddenBeforeAnimation;
            self.animationConstraint = self.centerXAlignmentConstraint;
            break;
        case KSModalTransitionModeFromRight:
            self.constraintConstantHiddenBeforeAnimation =  self.view.frame.size.width;
            self.centerXAlignmentConstraint.constant = self.constraintConstantHiddenBeforeAnimation;
            self.animationConstraint = self.centerXAlignmentConstraint;
            break;
        default:
            break;
    }
}

- (void)dismissViewControllerWithCompletion:(void (^)())completion {
    self.animationConstraint.constant = self.constraintConstantHiddenBeforeAnimation;
    [UIView animateWithDuration:ModalCenterContentViewControllerAnimationDurationDisappear delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.backgroundView.alpha = 0;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:^{
            if (completion) {
                completion();
            }
        }];
    }];
}

#pragma mark - actions

- (IBAction)closeModalViewController:(id)sender {
    [self dismissCharleeneAnimated:YES completion:nil];
}

#pragma mark - private helper

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"containingSegue"]) {
        UIViewController *viewController = [segue destinationViewController];
        [viewController addChildViewController:self.containingViewController];
        self.containingViewController.view.frame = viewController.view.frame;
        [viewController.view addSubview:self.containingViewController.view];
        [viewController didMoveToParentViewController:viewController];
    }
}


@end
