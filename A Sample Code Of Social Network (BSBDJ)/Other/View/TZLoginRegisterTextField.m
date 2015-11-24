//
//  TZLoginRegisterTextField.m
//  A Sample Code Of Social Network (BSBDJ)
//
//  Created by Tim.Z on 11/24/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZLoginRegisterTextField.h"
#import <objc/runtime.h>

@implementation TZLoginRegisterTextField

- (void)awakeFromNib
{
    // 设置光标颜色
    self.tintColor = [UIColor whiteColor];
    // 设置默认的占位文字颜色
    self.placeholderColor = [UIColor grayColor];
    
    
#warning 黑魔法runtime
        //    unsigned int count;
        //    Ivar *ivarList = class_copyIvarList([UITextField class], &count);
        //    for (int i = 0; i < count; i++) {
        //        Ivar ivar = ivarList[i];
        //        NSLog(@"%s", ivar_getName(ivar));
        //    }
        //    free(ivarList);
}

/**
 *  调用时刻 : 成为第一响应者(开始编辑\弹出键盘\获得焦点)
 */
- (BOOL)becomeFirstResponder
{
    self.placeholderColor = [UIColor whiteColor];
    return [super becomeFirstResponder];
}

/**
 *  调用时刻 : 不做第一响应者(结束编辑\退出键盘\失去焦点)
 */
- (BOOL)resignFirstResponder
{
    self.placeholderColor = [UIColor grayColor];
    return [super resignFirstResponder];
}

@end
