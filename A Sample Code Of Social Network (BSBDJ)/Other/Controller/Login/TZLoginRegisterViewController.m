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
- (IBAction)loginRegister
{
    [self dismissViewControllerAnimated:NO completion:nil];
    
    if (self.delegateSignal2) {
        [self.delegateSignal2 sendNext:nil];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.delegateSignal) {
        [self.delegateSignal sendNext:nil];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
