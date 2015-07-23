//
//  Programming_DemoViewController.m
//  connection
//
//  Created by Sam on 18/02/15.
//  Copyright (c) 2015 Bets. All rights reserved.
//

#import "Programming_DemoViewController.h"

@interface Programming_DemoViewController ()

@end

@implementation Programming_DemoViewController
@synthesize text1;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //NSMutableData *_responseData;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]];
    
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (conn==nil) {
        NSLog(@"connection not establish");
    }
    else
    {
        NSLog(@"connection  establish");
      
    }
    NSString *str = [NSString stringWithFormat:@"<IS> <Value> <Signature>-804</Signature> <Amount>139</Amount> </Value> <Value> <Signature>-845</Signature> <Amount>639466</Amount> </Value> <Value> <Signature>-811</Signature> <Amount>16438344</Amount> </Value> <Value> <Signature>-1115</Signature> <Amount>-159733</Amount> </Value> </IS>"];
    text1.text=str;
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSXMLParser *xml = [ [NSXMLParser alloc] initWithData:data];
    [xml parse];
    //text1.text=xml;
    //NSLog(@"%@",[xml.rootElement]);
    //NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:nil]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    NSLog(@"textViewShouldBeginEditing1");
    [text1 setSelectedRange:NSMakeRange(0, text1.text.length)];
    //[text1 setText:@""];
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"textViewDidBeginEditing");
    [text1 setSelectedRange:NSMakeRange(0, text1.text.length)];
    [text1 setText:@""];
}
- (BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    NSLog(@"textView save changes");
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"textViewDidChange");
}

@end
