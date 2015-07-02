//
//  ViewControllerOfYourChoice.m
//  Charleene
//
//  Created by Kersten Broich on 23/06/15.
//  Copyright (c) 2015 Kersten Broich. All rights reserved.
//

#import "KSViewControllerOfYourChoice.h"
#import "UIViewController+Charleene.h"

@interface KSViewControllerOfYourChoice ()

@property (nonatomic, copy) NSArray *items;

@end

@implementation KSViewControllerOfYourChoice 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Containing VC";
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    
    self.items = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemoCell"];
    
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    if ([self.delegate respondsToSelector:@selector(didSelectItem:)]) {
        [self.delegate didSelectItem:self.items[indexPath.row]];
    }
}


@end
