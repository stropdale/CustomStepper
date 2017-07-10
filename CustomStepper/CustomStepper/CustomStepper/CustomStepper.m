//
//  CustomStepper.m
//  CustomStepper
//
//  Created by Richard Stockdale on 03/07/2017.
//  Copyright © 2017 Junction Seven. All rights reserved.
//

#import "CustomStepper.h"

@interface CustomStepper ()

@property (nonatomic, strong) UpButton *upbutton;
@property (nonatomic, strong) DownButton *downbutton;
@property (nonatomic, strong) UILabel *counter;

@end

@implementation CustomStepper

- (void) setUpComponents {
    [self counter];
    [self upbutton];
    [self downbutton];
    
    self.counter.text = [NSString stringWithFormat:@"%ld", self.stepperValue];
}

#pragma mark - Button taps

- (void) upButtonTapped {
    if (self.stepperValue + 1 > self.maxValue) {
        return;
    }
    
    self.stepperValue++;
    self.counter.text = [NSString stringWithFormat:@"%ld", self.stepperValue];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void) downButtonTapped {
    if (self.stepperValue - 1 < self.minValue) {
        return;
    }
    
    self.stepperValue--;
    self.counter.text = [NSString stringWithFormat:@"%ld", self.stepperValue];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark - Getters

- (UIButton *) upbutton {
    if (!_upbutton) {
        CGRect f = CGRectMake(self.frame.size.width - self.frame.size.height, 0, self.frame.size.height, self.frame.size.height);
        _upbutton = [[UpButton alloc] initWithFrame:f];
        [_upbutton addTarget:self action:@selector(upButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_upbutton];
    }
    
    _upbutton.circleColour = self.stepperThemeColour;
    
    return _upbutton;
}

- (UIButton *) downbutton {
    if (!_downbutton) {
        CGRect f = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
        _downbutton = [[DownButton alloc] initWithFrame:f];
        [_downbutton addTarget:self action:@selector(downButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_downbutton];
    }
    
    _downbutton.circleColour = self.stepperThemeColour;
    
    return _downbutton;
}

- (UILabel *) counter {
    if (!_counter) {
        _counter = [[UILabel alloc] initWithFrame:self.bounds];
        _counter.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_counter];
    }
    
    _counter.textColor = self.stepperThemeColour;
    _counter.font = self.counterFont;
    
    return _counter;
}

#pragma mark - Setters

- (void) setStepperThemeColour:(UIColor *)stepperThemeColour {
    _stepperThemeColour = stepperThemeColour;
    [self setUpComponents];
}

- (void) setSymbolColour:(UIColor *)symbolColour {
    _symbolColour = symbolColour;
    [self setUpComponents];
}

- (void) setStepperValue:(NSInteger)stepperValue {
    _stepperValue = stepperValue;
    [self setUpComponents];
}

- (void) setCounterFont:(UIFont *)counterFont {
    _counterFont = counterFont;
    [self setUpComponents];
}

#pragma mark - Object Lifecycle

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpComponents];
        
        _maxValue = 99;
        _symbolColour = UIColor.whiteColor;
        _stepperThemeColour = UIColor.lightGrayColor;
        _counterFont = [UIFont systemFontOfSize:17];
    }
    
    return self;
}

@end

@implementation UpButton

 - (void)drawRect:(CGRect)frame {
     if (!self.circleColour) {
         self.circleColour = UIColor.lightGrayColor;
     }
     if (!self.symbolColour) {
         self.symbolColour = UIColor.whiteColor;
     }
     
     //// Subframes
     CGRect group = CGRectMake(CGRectGetMinX(frame) + 9, CGRectGetMinY(frame) + 5, frame.size.width - 10, frame.size.height - 10);
     
     //// Oval Drawing
     UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(group) + floor(group.size.width * 0.00000 + 0.5), CGRectGetMinY(group) + floor(group.size.height * 0.00000 + 0.5), floor(group.size.width * 1.00000 + 0.5) - floor(group.size.width * 0.00000 + 0.5), floor(group.size.height * 1.00000 + 0.5) - floor(group.size.height * 0.00000 + 0.5))];
     [self.circleColour setFill];
     [ovalPath fill];
     
     
     //// + sign vertical stroke
     UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + floor(group.size.width * 0.46000 + 0.5), CGRectGetMinY(group) + floor(group.size.height * 0.26000 + 0.5), floor(group.size.width * 0.54000 + 0.5) - floor(group.size.width * 0.46000 + 0.5), floor(group.size.height * 0.74000 + 0.5) - floor(group.size.height * 0.26000 + 0.5))];
     [self.symbolColour setFill];
     [rectangle2Path fill];
     
     
     //// + sign horizontal stroke
     UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + floor(group.size.width * 0.24000 + 0.5), CGRectGetMinY(group) + floor(group.size.height * 0.46000 + 0.5), floor(group.size.width * 0.76000 + 0.5) - floor(group.size.width * 0.24000 + 0.5), floor(group.size.height * 0.54000 + 0.5) - floor(group.size.height * 0.46000 + 0.5))];
     [self.symbolColour setFill];
     [rectanglePath fill];
}

@end

@implementation DownButton

 - (void)drawRect:(CGRect)frame {
     if (!self.circleColour) {
         self.circleColour = UIColor.lightGrayColor;
     }
     if (!self.symbolColour) {
         self.symbolColour = UIColor.whiteColor;
     }
     
     //// Subframes
     CGRect group = CGRectMake(CGRectGetMinX(frame) + 1, CGRectGetMinY(frame) + 5, frame.size.width - 10, frame.size.height - 10);
     
     
     //// Oval Drawing
     UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(group) + floor(group.size.width * 0.00000 + 0.5), CGRectGetMinY(group) + floor(group.size.height * 0.00000 + 0.5), floor(group.size.width * 1.00000 + 0.5) - floor(group.size.width * 0.00000 + 0.5), floor(group.size.height * 1.00000 + 0.5) - floor(group.size.height * 0.00000 + 0.5))];
     [self.circleColour setFill];
     [ovalPath fill];
     
     
     //// - sign horizontal stroke
     UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + floor(group.size.width * 0.24000 + 0.5), CGRectGetMinY(group) + floor(group.size.height * 0.46000 + 0.5), floor(group.size.width * 0.76000 + 0.5) - floor(group.size.width * 0.24000 + 0.5), floor(group.size.height * 0.54000 + 0.5) - floor(group.size.height * 0.46000 + 0.5))];
     [self.symbolColour setFill];
     [rectanglePath fill];
 }

@end
