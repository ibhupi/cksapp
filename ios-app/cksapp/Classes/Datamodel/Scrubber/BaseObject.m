//
//  BaseObject.m
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

#import "BaseObject.h"

@implementation BaseObject

// IMP: Don't remove this method. This is to protect Base Object extension to prevent crash
// when someone might remove propery from class but forget to remove from scrubber
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
#ifdef DEBUG
    //    [NSException raise:@"Unimplemented key in BaseObject: " format:@"UndefinedKey: %@ - Class: %@, keyValue: %@, keyValueClass: %@", key, [[self class] description], value, [value class]];
#endif
    // Override this method so that we can add more keys which might be missing at client side
}

@end
