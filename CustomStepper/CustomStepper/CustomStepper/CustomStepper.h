//
//  CustomStepper.h
//  CustomStepper
//
//  Created by Richard Stockdale on 03/07/2017.
//  Copyright © 2017 Junction Seven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomStepper : UIControl

@property (nonatomic) NSInteger minValue; // Default is 0
@property (nonatomic) NSInteger maxValue; // Default is 99

@property (nonatomic) NSInteger stepperValue; // Default is 0;

@end
