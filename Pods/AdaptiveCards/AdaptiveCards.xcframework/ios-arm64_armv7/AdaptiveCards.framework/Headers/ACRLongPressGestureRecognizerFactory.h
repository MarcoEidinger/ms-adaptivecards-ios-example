//
//  ACRLongPressGestureRecognizerFactory
//  ACRLongPressGestureRecognizerFactory.h
//
//  Copyright © 2018 Microsoft. All rights reserved.
//
#import "ACRIContentHoldingView.h"
#import "ACRLongPressGestureRecognizerEventHandler.h"
#import "ACRView.h"
#import "BaseActionElement.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ACRLongPressGestureRecognizerFactory : NSObject
/// instantiates a target for UITapGestureRecognizer object
/// and instantiate a tap gesture reconginizer with target, and return it
+ (void)addLongPressGestureRecognizerToUIView:(UIView<ACRIContentHoldingView> *_Nonnull)viewGroup
                                     rootView:(ACRView *_Nonnull)rootView
                                recipientView:(UIView *_Nonnull)receipientView
                                actionElement:(ACOBaseActionElement * _Nonnull)action
                                   hostConfig:(ACOHostConfig *_Nonnull)config;

+ (UILongPressGestureRecognizer *_Nullable)getGestureRecognizer:(UIView<ACRIContentHoldingView> *_Nonnull)viewGroup
                                                         target:(NSObject<ACRSelectActionDelegate> *_Nonnull)target;

+ (void)addTapGestureRecognizerToUITextView:(UITextView *_Nonnull)textView
                                     target:(NSObject<ACRSelectActionDelegate> *_Nonnull)target
                                   rootView:(ACRView *_Nonnull)rootView
                                 hostConfig:(ACOHostConfig *_Nonnull)config;

@end
