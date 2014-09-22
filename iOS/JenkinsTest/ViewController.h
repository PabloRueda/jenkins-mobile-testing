//
//  ViewController.h
//  JenkinsTest
//
//  Created by Pablo on 17/09/14.
//  Copyright (c) 2014 Pablo Rueda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@property (weak, nonatomic) IBOutlet UIButton *mainButton;

- (IBAction)buttonClicked:(UIButton *)sender;

@end
