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
    
	model = [[History alloc] init];
	view = [[BoardView alloc] initWithModel:model];
	controller = [[Controller alloc] initWithModel:model];

	// move to controller class
	[[NSNotificationCenter defaultCenter] addObserver:controller selector:@selector(mouseDownEventHandler:) name:[GlobalEvents MOUSEDOWN_EVENT] object:view ];
	[[NSNotificationCenter defaultCenter] addObserver:controller selector:@selector(mouseUpEventHandler:) name:[GlobalEvents MOUSEUP_EVENT] object:view ];

	[controller reset];

	Piece *piece;
	for (int i=0; i<[model.currentMove.squares count]; i++) {
		piece = [model.currentMove getSquare:i];
		[Logger logMoves:[piece getPossibleMoves :model.currentMove :[Board getColumn:i] :[Board getRow:i]] :piece];
	}
	
	
	[window makeKeyAndVisible];
	[window addSubview:view];
	[view release];
	
	
    return YES;
}

- (void) test{
	[controller movePiece:[[Move alloc] init:E :Two :E :Four]];
	[controller undo];
	[controller movePiece:[[Move alloc] init:D :Two :D :Four]];
	[controller movePiece:[[Move alloc] init:E :Seven :E :Five]];
	[controller movePiece:[[Move alloc] init:G :One :F :Three]];
	[controller undo];
	[controller undo];
	[controller undo];
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
