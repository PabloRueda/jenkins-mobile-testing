//
//  ViewController.m
//  JenkinsTest
//
//  Created by Pablo on 17/09/14.
//  Copyright (c) 2014 Pablo Rueda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(UIButton *)sender {
    self.mainLabel.text = @"Clicked";
}

@end
