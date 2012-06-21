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
		column = [GlobalFunctions columnEnumToString:move.toSquare.column];
		row = [GlobalFunctions rowEnumToString:move.toSquare.row];
		NSLog(@"move: %@%@", column, row);
	}
}

+ (void) logMoves:(NSMutableArray*)moves :(Piece*)piece{
	NSString *column;
	NSString *row;
	for (Move *move in moves) {
		column = [GlobalFunctions columnEnumToString:move.toSquare.column];
		row = [GlobalFunctions rowEnumToString:move.toSquare.row];
		NSLog(@"piece: %@ %@%@->%@%@", [piece display], [GlobalFunctions columnEnumToString:move.fromSquare.column], [GlobalFunctions rowEnumToString:move.fromSquare.row], [GlobalFunctions columnEnumToString:move.toSquare.column], [GlobalFunctions rowEnumToString:move.toSquare.row]);
	}
}


@end
