//
//  ResultViewController.h
//  Chess
//
//  Created by Akshay Budhkar on 2015-03-07.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController

@property (nonatomic, strong) NSString *playerOneName;
@property (nonatomic, strong) NSString *playerTwoName;
@property (strong, nonatomic) IBOutlet UISegmentedControl *resultUISegment;


@end
