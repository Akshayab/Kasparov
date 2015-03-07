//
//  ViewController.m
//  Chess
//
//  Created by Akshay Budhkar on 2015-03-07.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import "ChessTimerViewController.h"
#define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0)

@interface ChessTimerViewController ()

@end

@implementation ChessTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.playerOneView.userInteractionEnabled = YES;
    self.playerTwoView.userInteractionEnabled = YES;
    
    self.playerOnePlaying = YES;
    
    UITapGestureRecognizer *timerOneGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTime1)];
    
    [self.playerOneView addGestureRecognizer:timerOneGesture];
    
    UITapGestureRecognizer *timerTwoGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTime2)];
    
    self.timer1.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180));
    
    [self.playerTwoView addGestureRecognizer:timerTwoGesture];
    
    [self resetButtonPressed:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapTime1 {
    self.playerOnePlaying = NO;
    UIColor *greenColor = [UIColor colorWithRed:26.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:1.0];
    
    self.playerOneView.backgroundColor = [UIColor whiteColor];
    self.timer1.textColor = greenColor;
    
    self.playerTwoView.backgroundColor = greenColor;
    self.timer2.textColor = [UIColor whiteColor];
    
    if (!self.started) {
        [self startButtonPressed:nil];
    }
}

-(void)tapTime2 {
    self.playerOnePlaying = YES;
    UIColor *greenColor = [UIColor colorWithRed:26.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:1.0];
    self.playerOneView.backgroundColor = greenColor;
    self.timer1.textColor = [UIColor whiteColor];
    
    self.playerTwoView.backgroundColor = [UIColor whiteColor];
    self.timer2.textColor = greenColor;
    
    if (!self.started) {
        [self startButtonPressed:nil];
    }
}

-(void)updateTimer {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss.SSS"];
    if (!self.paused) {
        if (self.playerOnePlaying) {
            
            self.totalTimeOne = [self.totalTimeOne dateByAddingTimeInterval:-1.0/10.0];
            
            self.timer1.text = [dateFormatter stringFromDate:self.totalTimeOne];
            
            if ([self.totalTimeOne compare:[dateFormatter dateFromString:@"00:00.000"]] == NSOrderedAscending) {
                [self timeCompleted];
            }
        }
        else {
            
            self.totalTimeTwo = [self.totalTimeTwo dateByAddingTimeInterval:-1.0/10.0];
            
            self.timer2.text = [dateFormatter stringFromDate:self.totalTimeTwo];
            
            if ([self.totalTimeTwo compare:[dateFormatter dateFromString:@"00:00.000"]] == NSOrderedAscending) {
                [self timeCompleted];
            }
        }
        
        
    }
}

- (IBAction)pauseButtonPressed:(id)sender {
    self.paused = YES;
}

- (IBAction)startButtonPressed:(id)sender {
    self.paused = NO;
    self.started = YES;
    [self.startButton setTitle:@"Play" forState:UIControlStateNormal];

    if (!self.stopWatchTimer) {
        self.stopWatchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    }
}

- (IBAction)resetButtonPressed:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss.SSS"];
    
    NSString *timeString = [NSString stringWithFormat:@"%@:00.000", self.gameTime];
    self.totalTimeOne = [dateFormatter dateFromString: timeString];
    self.totalTimeTwo = [dateFormatter dateFromString: timeString];
    
    self.timer1.text = [dateFormatter stringFromDate:self.totalTimeOne];
    self.timer2.text = [dateFormatter stringFromDate:self.totalTimeTwo];
    
    UIColor *greenColor = [UIColor colorWithRed:26.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:1.0];
    self.playerOneView.backgroundColor = greenColor;
    self.timer1.textColor = [UIColor whiteColor];
    
    self.playerTwoView.backgroundColor = [UIColor whiteColor];
    self.timer2.textColor = greenColor;
    
    self.started = NO;
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    self.paused = YES;
}

- (void)timeCompleted {
    UIColor *redColor = [UIColor colorWithRed:231.0/255.0 green:76.0/255.0 blue:60.0/255.0 alpha:1.0];
    self.paused = YES;
    
    if (self.playerOnePlaying) {
        self.playerOneView.backgroundColor = redColor;
    }
    else {
        self.playerTwoView.backgroundColor = redColor;
    }
}

@end
