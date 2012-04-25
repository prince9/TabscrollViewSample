//
//  FirstViewController.m
//  TabScrollViewSample
//
//  Created by 真有 津坂 on 12/04/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize myscrollView;
@synthesize myField;
@synthesize myField2;
@synthesize myLabel;
@synthesize myLabel2;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //追加、scrollViewのサイズを設定
    self.myscrollView.contentSize = CGSizeMake(320, 411);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardDidHideNotification object:nil];
    keyboardShown = NO;
}

//以下追加、UIKeyboardDidShowNotificationが送信されたときに実行される
- (void)keyboardShow:(NSNotification *)notificatioin {
    
    if (keyboardShown) {
        return;
    }
    
    NSDictionary *info = [notificatioin userInfo];
    
    //キーボードのサイズを取得
    NSValue *keyboardValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keySize = [keyboardValue CGRectValue].size;
    
    offset = myscrollView.contentOffset;
    
    //scrollViewのサイズを変更
    CGRect scrollViewFrame = myscrollView.frame;
    scrollViewFrame.size.height -= keySize.height;
    myscrollView.frame = scrollViewFrame;
    
    //スクロールする
    CGRect textFieldRect = myField.frame;
    textFieldRect.origin.y += 10;
    [myscrollView scrollRectToVisible:textFieldRect animated:YES];
    
    keyboardShown = YES;
}

//以下追加、UIKeyboardDidHideNotificationが送信されたときに実行される
- (void)keyboardHide:(NSNotification *)notificatioin {
    if (!keyboardShown) {
        return;
    }    
    
    //scrollViewをもとに戻す
    myscrollView.frame = CGRectMake(0, 0, 320, 460);
    myscrollView.contentOffset = offset;
    keyboardShown = NO;
    
}



- (void)viewDidUnload
{
    [self setMyscrollView:nil];
    [self setMyField:nil];
    [self setMyField2:nil];
    [self setMyLabel:nil];
    [self setMyLabel2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)goText1:(id)sender {
    myLabel.text = myField.text;
}

- (IBAction)goText2:(id)sender {
    myLabel2.text = myField2.text;
}
@end
