//
//  NSString+TZExtension.m
//  TZBSBDJ
//
//  Created by Tim.Z on 11/17/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "NSString+TZExtension.h"

@implementation NSString (TZExtension)

- (unsigned long long)fileSize
{
    unsigned long long size = 0;
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectory = NO;
    
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    
    if (!exists) {
        return size;
    }
    
    if (isDirectory) {
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
    }else {
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    return  size;
}

@end
