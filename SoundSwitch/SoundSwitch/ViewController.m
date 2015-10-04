//
//  ViewController.m
//  SoundSwitch
//
//  Created by Moshe Gottlieb on 6/2/13.
//  Copyright (c) 2013 Moshe Gottlieb. All rights reserved.
//

#import "ViewController.h"
#import "SharkfoodMuteSwitchDetector.h"
#import "JPSVolumeButtonHandler.h"

@interface ViewController (){
    NSInteger powerCount;
    NSInteger increaseCount;
    NSInteger decreaseCount;
    NSInteger soundCount;
    NSInteger homecount;
    JPSVolumeButtonHandler *volumeButtonHandler;
    SharkfoodMuteSwitchDetector* detector;
}

@end

@implementation ViewController
@synthesize powerlabel,voldecreaselabel,volincreaselabel,soundonofflabel,resetButton,homelabel;

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self->detector = [SharkfoodMuteSwitchDetector shared];
        __weak ViewController* sself = self;
        self->detector.silentNotify = ^(BOOL silent){
            [sself.stateLabel setText:silent?@"ON":@"OFF"];
            soundCount++;
            soundonofflabel.text = [NSString stringWithFormat:@"%ld",(long)soundCount];
        };
        
        self->volumeButtonHandler = [JPSVolumeButtonHandler volumeButtonHandlerWithUpBlock:^{
            // Volume Up Button Pressed+
            //NSLog(@"efefe");
            increaseCount++;
            volincreaselabel.text = [NSString stringWithFormat:@"%li",(long)increaseCount];
        } downBlock:^{
            // Volume Down Button Pressed
            //NSLog(@"fefeger");
            decreaseCount++;
            voldecreaselabel.text = [NSString stringWithFormat:@"%li",(long)decreaseCount];
            
        }];
    }
    
    
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *statusImage = [UIImage imageNamed:@"background.png"];
    UIImageView *activityImageView = [[UIImageView alloc] initWithImage:statusImage];
    activityImageView.frame = CGRectMake(self.view.frame.size.width * 2/ 9 ,self.view.frame.size.height / 7,self.view.frame.size.width * 5 / 9, self.view.frame.size.height * 2 / 3);
    [self.view addSubview:activityImageView];
    
    [resetButton setTranslatesAutoresizingMaskIntoConstraints:YES];
    [resetButton setFrame:CGRectMake(0, self.view.frame.size.height * 0.9, self.view.frame.size.width, self.view.frame.size.height / 10)];
    [powerlabel setTranslatesAutoresizingMaskIntoConstraints:YES];
    [powerlabel setFrame:CGRectMake(self.view.frame.size.width * 0.82, self.view.frame.size.height * 0.3, self.view.frame.size.width / 9, self.view.frame.size.height / 30)];
    
    [voldecreaselabel setTranslatesAutoresizingMaskIntoConstraints:YES];
    [voldecreaselabel setFrame:CGRectMake(self.view.frame.size.width * 0.05, self.view.frame.size.height * 0.35, self.view.frame.size.width / 9, self.view.frame.size.height / 30)];
    [volincreaselabel setTranslatesAutoresizingMaskIntoConstraints:YES];
    [volincreaselabel setFrame:CGRectMake(self.view.frame.size.width * 0.05, self.view.frame.size.height * 0.3, self.view.frame.size.width / 9, self.view.frame.size.height / 30)];
    [soundonofflabel setTranslatesAutoresizingMaskIntoConstraints:YES];
    [soundonofflabel setFrame:CGRectMake(self.view.frame.size.width * 0.05, self.view.frame.size.height * 0.25, self.view.frame.size.width / 9, self.view.frame.size.height / 30)];
    
    [homelabel setTranslatesAutoresizingMaskIntoConstraints:YES];
    [homelabel setFrame:CGRectMake(self.view.frame.size.width * 0.45, self.view.frame.size.height * 0.83, self.view.frame.size.width / 9, self.view.frame.size.height / 30)];
    
    powerCount = 0;
    increaseCount = 0;
    decreaseCount = 0;
    soundCount = -1;
    homecount = 0;
    powerlabel.text = [NSString stringWithFormat:@"%ld",(long)powerCount];
    volincreaselabel.text = [NSString stringWithFormat:@"%ld",(long)increaseCount];
    voldecreaselabel.text = [NSString stringWithFormat:@"%ld",(long)decreaseCount];
    soundonofflabel.text = [NSString stringWithFormat:@"%ld",(long)soundCount];
    homelabel.text = [NSString stringWithFormat:@"%ld",(long)homecount];
    
    
    
    /*self->volumeButtonHandler = [JPSVolumeButtonHandler volumeButtonHandlerWithUpBlock:^{
        // Volume Up Button Pressed+
        //NSLog(@"efefe");
        increaseCount++;
        volincreaselabel.text = [NSString stringWithFormat:@"%li",(long)increaseCount];
    } downBlock:^{
        // Volume Down Button Pressed
        //NSLog(@"fefeger");
        decreaseCount++;
        voldecreaselabel.text = [NSString stringWithFormat:@"%li",(long)decreaseCount];
        
    }];*/
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)resetButtonClick:(id)sender {
    powerCount = 0;
    increaseCount = 0;
    decreaseCount = 0;
    soundCount = 0;
    homecount = 0;
    powerlabel.text = [NSString stringWithFormat:@"%li",(long)powerCount];
    volincreaselabel.text = [NSString stringWithFormat:@"%li",(long)increaseCount];
    voldecreaselabel.text = [NSString stringWithFormat:@"%li",(long)decreaseCount];
    soundonofflabel.text = [NSString stringWithFormat:@"%li",(long)soundCount];
    homelabel.text = [NSString stringWithFormat:@"%li",(long)homecount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
