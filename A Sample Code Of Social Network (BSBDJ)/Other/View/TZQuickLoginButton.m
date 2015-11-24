//
//  TZQuickLoginButton.m
//  A Sample Code Of Social Network (BSBDJ)
//
//  Created by Tim.Z on 11/24/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZQuickLoginButton.h"

@implementation TZQuickLoginButton

- (void)awakeFromNib
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.tz_y = 0;
    self.imageView.tz_centerX = self.tz_width * 0.5;
    
    self.titleLabel.tz_x = 0;
    self.titleLabel.tz_y = self.imageView.tz_bottom;
    self.titleLabel.tz_height = self.tz_height - self.titleLabel.tz_y;
    self.titleLabel.tz_width = self.tz_width;
}

@end
