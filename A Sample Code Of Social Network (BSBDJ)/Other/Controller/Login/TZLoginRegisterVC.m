//
//  TZLoginRegisterVC.m
//  A Sample Code Of Social Network (BSBDJ)
//
//  Created by Tim.Z on 11/24/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZLoginRegisterVC.h"

@interface TZLoginRegisterVC ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;

@end

@implementation TZLoginRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close
{
    if (self.delegateSignal) {
        [self.delegateSignal sendNext:nil];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)showLoginOrRegister:(UIButton *)sender
{
    [self.view endEditing:YES];
    
    if (self.leftMargin.constant) {
        self.leftMargin.constant = 0;
        sender.selected = NO;
    } else {
        self.leftMargin.constant = -self.view.tz_width;
        sender.selected = YES;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
