//
//  ViewController.m
//  RPN
//
//  Created by epita on 20/04/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    _operands = [NSMutableArray arrayWithCapacity:2];
    
    _number = [[NSNumber alloc] initWithInteger:[_label.text integerValue]];
}

- (IBAction)numberClicked:(UIButton*)sender {
    
    NSLog(@"number: %@", sender.currentTitle);
    
    if (([_label.text isEqualToString:@"0"]) || _cleanDisplay){
        _label.text = @"";
        _cleanDisplay = false;
    }
    
    _label.text = [_label.text stringByAppendingString:sender.currentTitle];
}

- (IBAction)clearAction:(id)sender {
    
    _label.text = @"0";
    [_operands removeAllObjects];
    
    _cleanDisplay = false;
}


- (IBAction)operatorAction:(UIButton*)sender {
    
    NSString* operationStr = [sender.currentTitle substringToIndex:1];
    const char *operation =  [operationStr UTF8String];
    
    if([_operands count] == 2)
    {
        long firstNumber = [(NSNumber*)_operands[0] longValue];
        long secondNumber = [(NSNumber*)_operands[1] longValue];
    
        if (*operation == 'x') {
            _label.text = [NSString stringWithFormat:@"%ld",firstNumber * secondNumber];
        
        }else if(*operation == '/'){
            _label.text = [NSString stringWithFormat:@"%ld",firstNumber / secondNumber];
        
        }else if(*operation == '+'){
            _label.text = [NSString stringWithFormat:@"%ld",firstNumber + secondNumber];
        
        }else if(*operation == '-'){
            _label.text = [NSString stringWithFormat:@"%ld",firstNumber - secondNumber];
        }
    
        [_operands removeAllObjects];
        _number = [[NSNumber alloc] initWithInteger:[_label.text integerValue]];
    
        [_operands addObject:_number];
        
    }
}

- (IBAction)enterClicked:(UIButton*)sender {

    _number = [[NSNumber alloc] initWithInteger:[_label.text integerValue]];
    
    [_operands addObject:_number];
    _cleanDisplay = true;
    
}

@end
