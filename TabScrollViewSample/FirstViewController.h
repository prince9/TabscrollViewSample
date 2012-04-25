//
//  FirstViewController.h
//  TabScrollViewSample
//
//  Created by 真有 津坂 on 12/04/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController {
    //以下追加
    BOOL keyboardShown;
    CGPoint offset;
}
@property (weak, nonatomic) IBOutlet UIScrollView *myscrollView;
@property (weak, nonatomic) IBOutlet UITextField *myField;

@property (weak, nonatomic) IBOutlet UITextField *myField2;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UILabel *myLabel2;


- (IBAction)goText1:(id)sender;
- (IBAction)goText2:(id)sender;


@end
