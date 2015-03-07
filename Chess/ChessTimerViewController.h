//
//  ViewController.h
//  Chess
//
//  Created by Akshay Budhkar on 2015-03-07.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChessTimerViewController : UIViewController <UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *timer1;
@property (strong, nonatomic) IBOutlet UILabel *timer2;
@property (strong, nonatomic) IBOutlet UIView *playerOneView;
@property (strong, nonatomic) IBOutlet UIView *playerTwoView;
@property (strong, nonatomic) IBOutlet UIButton *startButton;


- (IBAction)pauseButtonPressed:(id)sender;
- (IBAction)startButtonPressed:(id)sender;
- (IBAction)resetButtonPressed:(id)sender;

@property (assign, nonatomic) BOOL playerOnePlaying;
@property (assign, nonatomic) BOOL paused;
@property (strong, nonatomic) NSTimer *stopWatchTimer;
@property (assign, nonatomic) BOOL started;

@property (strong, nonatomic) NSDate *totalTimeOne;
@property (strong, nonatomic) NSDate *totalTimeTwo;
@end

