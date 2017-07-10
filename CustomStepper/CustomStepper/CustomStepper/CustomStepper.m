//
//  CustomStepper.m
//  CustomStepper
//
//  Created by Richard Stockdale on 03/07/2017.
//  Copyright © 2017 Junction Seven. All rights reserved.
//

#import "CustomStepper.h"

@interface CustomStepper ()

@property (nonatomic, strong) UIButton *upbutton;
@property (nonatomic, strong) UIButton *downbutton;
@property (nonatomic, strong) UILabel *counter;

@end

@implementation CustomStepper

- (void) setUpComponents {
    [self counter];
    [self upbutton];
    [self downbutton];
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

#pragma mark - Lazy Loading

- (UIButton *) upbutton {
    if (!_upbutton) {
        CGRect f = CGRectMake(self.frame.size.width - self.frame.size.height, 0, self.frame.size.height, self.frame.size.height);
        _upbutton = [[UIButton alloc] initWithFrame:f];
        [_upbutton setTitle:@"+" forState:UIControlStateNormal];
        [_upbutton addTarget:self action:@selector(upButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_upbutton];
    }
    
    return _upbutton;
}

- (UIButton *) downbutton {
    if (!_downbutton) {
        CGRect f = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
        _downbutton = [[UIButton alloc] initWithFrame:f];
        [_downbutton setTitle:@"-" forState:UIControlStateNormal];
        [_downbutton addTarget:self action:@selector(downButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_downbutton];
    }
    
    return _downbutton;
}

- (UILabel *) counter {
    if (!_counter) {
        _counter = [[UILabel alloc] initWithFrame:self.bounds];
        _counter.text = @"0";
        _counter.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_counter];
    }
    
    return _counter;
}

#pragma mark - Object Lifecycle

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpComponents];
        self.backgroundColor = [UIColor lightGrayColor];
        
        _maxValue = 99;
    }
    
    return self;
}

@end
