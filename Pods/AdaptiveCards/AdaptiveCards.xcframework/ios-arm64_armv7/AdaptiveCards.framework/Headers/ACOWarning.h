//
//  ACOWarning
//  ACOWarning.h
//
//  Copyright © 2020 Microsoft. All rights reserved.
//

#import "ACREnums.h"
#import <Foundation/Foundation.h>

@interface ACOWarning : NSObject

@property ACRWarningStatusCode statusCode;
@property NSString *message;

- (instancetype)initWith:(ACRWarningStatusCode)statusCode message:(NSString *)message;

@end
