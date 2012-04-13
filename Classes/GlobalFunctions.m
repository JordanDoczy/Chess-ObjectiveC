//
//  GlobalFunctions.m
//  app3
//
//  Created by Jordan Doczy on 3/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GlobalFunctions.h"

@implementation GlobalFunctions


+ (NSString*) colorEnumToString:(ColorEnum)color{
	switch (color) {
		case White:
			return @"White";
			break;
		case Black:
			return @"Black";
			break;
	}
	return nil;
}
+ (NSString*) columnEnumToString:(ColumnEnum)column{
		switch (column) {
			case A:
				return @"A";
				break;
			case B:
				return @"B";
				break;
			case C:
				return @"C";
				break;
			case D:
				return @"D";
				break;
			case E:
				return @"E";
				break;
			case F:
				return @"F";
				break;
			case G:
				return @"G";
				break;
			case H:
				return @"H";
				break;
		}
		return nil;
		
}
+ (NSString*) pieceEnumToString:(PieceEnum)piece{
	switch (piece) {
		case KingPiece:
			return @"King";
			break;
		case QueenPiece:
			return @"Queen";
			break;
		case RookPiece:
			return @"Rook";
			break;
		case BishopPiece:
			return @"Bishop";
			break;
		case KnightPiece:
			return @"Knight";
			break;
		case PawnPiece:
			return @"Pawn";
			break;
	}
	return nil;
}
+ (NSString*) rowEnumToString:(RowEnum)row{
	switch (row) {
		case One:
			return @"1";
			break;
		case Two:
			return @"2";
			break;
		case Three:
			return @"3";
			break;
		case Four:
			return @"4";
			break;
		case Five:
			return @"5";
			break;
		case Six:
			return @"6";
			break;
		case Seven:
			return @"7";
			break;
		case Eight:
			return @"8";
			break;
	}
	return nil;
	
}

@end
