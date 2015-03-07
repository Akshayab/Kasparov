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
    self.player1TextField.delegate = self;
    self.player2TextField.delegate = self;
    self.gameTimeTextField.delegate = self;
    
    
    // Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
//    [textField resignFirstResponder];
//    
//    if (textField == self.player1TextField) {
//        [self.player2TextField becomeFirstResponder];
//    }
//    else if (textField == self.player2TextField) {
//        [self.gameTimeTextField becomeFirstResponder];
//    }
//    
    [self.view endEditing:YES];
    return NO;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}


- (void)keyboardDidShow:(NSNotification *)notification
{
    // Assign new frame to your view
    [self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,320,460)];
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

-(IBAction)resetApp:(UIStoryboardSegue *)segue {
}

@end
