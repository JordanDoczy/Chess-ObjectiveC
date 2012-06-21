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

+ (void) logMoves:(NSArray*)moves{
	for (Move *move in moves) {
		[Logger logMove: move];
	}
}

+ (void) logMoves:(NSArray*)moves :(Piece*)piece{
	for (Move *move in moves) {
		NSLog(@"piece: %@ %@%@->%@%@", [piece display], [GlobalFunctions columnEnumToString:move.fromSquare.column], [GlobalFunctions rowEnumToString:move.fromSquare.row], [GlobalFunctions columnEnumToString:move.toSquare.column], [GlobalFunctions rowEnumToString:move.toSquare.row]);
	}
}

+ (void) logMove:(Move*)move{
	NSLog(@"%@%@->%@%@", [GlobalFunctions columnEnumToString:move.fromSquare.column], [GlobalFunctions rowEnumToString:move.fromSquare.row], [GlobalFunctions columnEnumToString:move.toSquare.column], [GlobalFunctions rowEnumToString:move.toSquare.row]);
}

+ (void) logSquare:(Square*)square{
	NSLog(@"%@%@", [GlobalFunctions columnEnumToString:square.column], [GlobalFunctions rowEnumToString:square.row]);
}

+ (void) logPiece:(Square*)square :(Piece*)piece{
	NSLog(@"%@: %@%@", [piece display], [GlobalFunctions columnEnumToString:square.column], [GlobalFunctions rowEnumToString:square.row]);
}


@end
