//
//  ViewController.h
//  SoundSwitch
//
//  Created by Moshe Gottlieb on 6/2/13.
//  Copyright (c) 2013 Moshe Gottlieb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *soundonofflabel;
@property (weak, nonatomic) IBOutlet UILabel *volincreaselabel;
@property (weak, nonatomic) IBOutlet UILabel *voldecreaselabel;
@property (weak, nonatomic) IBOutlet UILabel *powerlabel;
@property (weak, nonatomic) IBOutlet UILabel *homelabel;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@end
