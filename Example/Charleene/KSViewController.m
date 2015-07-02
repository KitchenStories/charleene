//
//  KSViewController.m
//  Charleene
//
//  Created by Kersten Broich on 06/25/2015.
//  Copyright (c) 2014 Kersten Broich. All rights reserved.
//

#import "KSViewController.h"
#import <Charleene/UIViewController+Charleene.h>

@interface KSViewController ()

@property (nonatomic, weak) IBOutlet UILabel *label;

@end

@implementation KSViewController

- (IBAction)cancelDialog:(id)sender {
    [self dismissCharleeneAnimated:YES completion:nil];
}

- (IBAction)present:(id)sender {
    KSViewControllerOfYourChoice *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewControllerOfYourChoice"];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelDialog:)];
    vc.navigationItem.leftBarButtonItem = leftBarButtonItem;
    vc.delegate = self;
    
    [self presentCharleeneModally:navigationController transitionMode:KSModalTransitionModeFromBottom];
}

- (void)didSelectItem:(id)item {
    if ([item isKindOfClass:[NSString class]]) {
        self.label.text = [NSString stringWithFormat:@"You selected: %@", item];
    }
    
    [self dismissCharleeneAnimated:YES completion:nil];
}

@end
