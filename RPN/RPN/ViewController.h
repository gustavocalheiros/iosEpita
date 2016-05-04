//
//  ViewController.h
//  RPN
//
//  Created by epita on 20/04/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (void)viewWillAppear:(BOOL)animated;

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) NSString* firstValue;
@property (nonatomic) NSMutableArray* operands;
@property (nonatomic) NSNumber* number;
@property (nonatomic, assign) BOOL cleanDisplay;

@end

