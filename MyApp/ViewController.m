//
//  ViewController.m
//  MyApp
//
//  Created by Wang on 6/6/13.
//  Copyright (c) 2013 Casetagram. All rights reserved.
//

#import "ViewController.h"

#import <CasetagramSDK/CasetagramSDK.h>

@interface ViewController () <CasetagramSDKDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	CGSize btnSize = CGSizeMake(200, 40);
	[startBtn setFrame:CGRectMake((self.view.frame.size.width - btnSize.width) / 2,
								  (self.view.frame.size.height - btnSize.height) / 2,
								  btnSize.width, btnSize.height)];
	[startBtn setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin];
	[startBtn setTitle:@"Start" forState:UIControlStateNormal];
	[startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:startBtn];
}

- (void)start
{
	[CTGManager setDelegate:self];
	[CTGManager setClientID:@"MyAppClientIDxxxxxxx"];
	[CTGManager setClientSecret:@"MyAppClientSecretxxxxxxxxxxxxxxxxxxxxxxx"];
	[CTGManager setRedirectURI:@"myapp://redirect"];
	[CTGManager setImage:[UIImage imageNamed:@"photo.jpg"]];
	[CTGManager setSkipMoveAndScale:YES];
	
	UIViewController *vc = [CTGManager newCasetagramViewController];
	[self presentModalViewController:vc animated:YES];
}

- (void)casetagramSDKOrderCompleted
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)casetagramSDKUserCancelled
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
