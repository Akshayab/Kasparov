//
//  TimerViewController.m
//  Chess
//
//  Created by Akshay Budhkar on 2015-03-07.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import "InitialViewController.h"
#import "ChessTimerViewController.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"timerSegue"]) {
        ChessTimerViewController *vc = (ChessTimerViewController *)[segue destinationViewController];
        vc.playerOneName = self.player1TextField.text;
        vc.playerTwoName = self.player2TextField.text;
        vc.gameTime = self.gameTimeTextField.text;
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"timerSegue"]) {
        if ([self.player1TextField.text isEqualToString: @""] || [self.player2TextField.text isEqualToString:@""] || [self.gameTimeTextField.text isEqualToString: @""]) {
            self.incompleteLabel.hidden = NO;
            return NO;
        }
    }
    
    return YES;
}

@end
