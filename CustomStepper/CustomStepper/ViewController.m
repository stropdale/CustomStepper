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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CustomStepper *stepper = [[CustomStepper alloc] initWithFrame:CGRectMake(20, 20, 90, 40)];
    [self.view addSubview:stepper];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
