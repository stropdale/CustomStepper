//
//  ViewController.m
//  CustomStepper
//
//  Created by Richard Stockdale on 03/07/2017.
//  Copyright © 2017 Junction Seven. All rights reserved.
//

#import "ViewController.h"
#import "CustomStepper.h"

@interface ViewController ()

@property (nonatomic, strong) CustomStepper *stepper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.stepper = [[CustomStepper alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - 45,  100, 90, 40)];
    self.stepper.stepperThemeColour = UIColor.redColor;
    
    [self.stepper addTarget:self action:@selector(stepperValueChanged) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.stepper];
}

- (void) stepperValueChanged {
    NSLog(@"Stepper value changed. Now %ld", self.stepper.stepperValue);
}

@end
