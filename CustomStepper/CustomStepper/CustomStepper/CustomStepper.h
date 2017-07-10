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

@property (nonatomic, strong) UIColor *stepperThemeColour; // Default colour is UIColor.lightGrey
@property (nonatomic, strong) UIColor *symbolColour; // Default colour is UIColor.whiteColor

@property (nonatomic, strong) UIFont *counterFont; // Default is system font 17

@end





/**
 Subclass to allow some custom drawing
 */
@interface UpButton : UIButton

@property (nonatomic, strong) UIColor *symbolColour;
@property (nonatomic, strong) UIColor *circleColour;
@end


/**
 Subclass to allow some custom drawing
 */
@interface DownButton : UIButton

@property (nonatomic, strong) UIColor *symbolColour;
@property (nonatomic, strong) UIColor *circleColour;

@end
