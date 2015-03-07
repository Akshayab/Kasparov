//
//  TimerViewController.h
//  Chess
//
//  Created by Akshay Budhkar on 2015-03-07.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel *incompleteLabel;
@property (strong, nonatomic) IBOutlet UITextField *player2TextField;
@property (strong, nonatomic) IBOutlet UITextField *gameTimeTextField;

@property (strong, nonatomic) IBOutlet UITextField *player1TextField;
@end
