//
//  Logger.m
//  Chess
//
//  Created by Jordan Doczy on 6/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GlobalFunctions.h"
#import "Logger.h"
#import "Move.h"
#import "Piece.h"

@implementation Logger

+ (void) logMoves:(NSMutableArray*)moves{
	NSString *column;
	NSString *row;
	for (Move *move in moves) {
		column = [GlobalFunctions columnEnumToString:move.toColumn];
		row = [GlobalFunctions rowEnumToString:move.toRow];
		NSLog(@"move: %@%@", column, row);
	}
}

+ (void) logMoves:(NSMutableArray*)moves :(Piece*)piece{
	NSString *column;
	NSString *row;
	for (Move *move in moves) {
		column = [GlobalFunctions columnEnumToString:move.toColumn];
		row = [GlobalFunctions rowEnumToString:move.toRow];
		NSLog(@"piece: %@ %@%@->%@%@", [piece display], [GlobalFunctions columnEnumToString:move.fromColumn], [GlobalFunctions rowEnumToString:move.fromRow], [GlobalFunctions columnEnumToString:move.toColumn], [GlobalFunctions rowEnumToString:move.toRow]);
	}
}


@end
