//
//  PieceFactory.m
//  app3
//
//  Created by Jordan Doczy on 3/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ColorEnum.h"
#import "PieceEnum.h"
#import "PieceFactory.h"
#import "Pieces.h"

@implementation PieceFactory

+ (id) createPiece:(PieceEnum)piece :(ColorEnum)color{
	
	switch (piece) {
		case KingPiece:
			return [[King alloc] init:color];
			break;
		case QueenPiece:
			return [[Queen alloc] init:color];
			break;
		case RookPiece:
			return [[Rook alloc] init:color];
			break;
		case BishopPiece:
			return [[Bishop alloc] init:color];
			break;
		case KnightPiece:
			return [[Knight alloc] init:color];
			break;
		case PawnPiece:
			return [[Pawn alloc] init:color];
			break;
	}
	return nil;
}

@end
