//
//  ChessAppDelegate.m
//  Chess
//
//  Created by Jordan Doczy on 3/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BoardView.h"
#import "ChessAppDelegate.h"
#import "ColumnEnum.h"
#import "Controller.h"
#import "GlobalEvents.h"
#import "History.h"
#import "Move.h"
#import "RowEnum.h"

#import "Pawn.h"
#import "Board.h"
#import "Logger.h"

@implementation ChessAppDelegate

@synthesize window;

Controller *controller;
History *model;
BoardView *view;

#pragma mark -
#pragma mark Application lifecycle


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	//TODO - replace NSNotificationCenter
	
	
	model = [[History alloc] init];
	view = [[BoardView alloc] initWithModel:model];
	controller = [[Controller alloc] initWithModel:model];
	
	[view addObserver:controller forKeyPath:@"currentMove" options:NSKeyValueObservingOptionNew context:nil];
	
	[controller reset];
	
	// TEST
	//[self test];
	UIButton *undo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[undo addTarget:controller action:@selector(undo:)forControlEvents:UIControlEventTouchDown];
	[undo setTitle:@"Undo" forState:UIControlStateNormal];
	undo.frame = CGRectMake(25.0, 410.0, 60.0, 25.0);
	[window addSubview:undo];
	
	UIButton *redo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[redo addTarget:controller action:@selector(redo:)forControlEvents:UIControlEventTouchDown];
	[redo setTitle:@"Redo" forState:UIControlStateNormal];
	redo.frame = CGRectMake(100.0, 410.0, 60.0, 25.0);
	[window addSubview:redo];

	UIButton *reset = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[reset addTarget:controller action:@selector(reset:)forControlEvents:UIControlEventTouchDown];
	[reset setTitle:@"Reset" forState:UIControlStateNormal];
	reset.frame = CGRectMake(175.0, 410.0, 60.0, 25.0);
	[window addSubview:reset];
	
	
	
	[window makeKeyAndVisible];
	[window addSubview:view];
	[view release];
	
	
    return YES;
}

- (void) test{
	[controller movePiece:[[Move alloc] init:E :Two :E :Four]];
	[controller movePiece:[[Move alloc] init:E :Seven :E :Five]];
	[controller movePiece:[[Move alloc] init:G :One :F :Three]];
	[controller movePiece:[[Move alloc] init:B :Eight :C :Six]];
	[controller movePiece:[[Move alloc] init:F :One :B :Five]];
	[controller movePiece:[[Move alloc] init:F :Eight :C :Five]];
	[controller movePiece:[[Move alloc] init:H :One :G :One]];
	[controller undo];
	[controller movePiece:[[Move alloc] init:E :One :G :One]];
	
}
- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}
- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}
- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
