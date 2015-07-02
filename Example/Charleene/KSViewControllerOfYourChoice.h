//
//  ViewControllerOfYourChoice.h
//  Charleene
//
//  Created by Kersten Broich on 23/06/15.
//  Copyright (c) 2015 Kersten Broich. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KSViewControllerOfYourChoiceDelegate <NSObject>

- (void)didSelectItem:(id)item;

@end

@interface KSViewControllerOfYourChoice : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<KSViewControllerOfYourChoiceDelegate> delegate;

@end
