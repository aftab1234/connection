//
//  Programming_DemoViewController.h
//  connection
//
//  Created by Sam on 18/02/15.
//  Copyright (c) 2015 Bets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Programming_DemoViewController : UIViewController<NSURLConnectionDelegate,UITextViewDelegate,NSXMLParserDelegate>
{
    NSMutableData *_responseData;
}
@property (nonatomic, strong) IBOutlet UITextView *text1;

@end
