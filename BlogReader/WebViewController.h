//
//  WebViewController.h
//  BlogReader
//
//  Created by Michael Alford on 2/10/16.
//  Copyright (c) 2016 Michael Alford. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic)NSURL *blogPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
