//
//  TZLoginRegisterViewController.m
//  A Sample Code Of Social Network (BSBDJ)
//
//  Created by Tim.Z on 11/23/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZLoginRegisterViewController.h"

@interface TZLoginRegisterViewController ()

@end

@implementation TZLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.delegateSignal) {
        [self.delegateSignal sendNext:nil];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
