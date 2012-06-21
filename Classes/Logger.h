//
//  Logger.h
//  Chess
//
//  Created by Jordan Doczy on 6/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Piece.h"

@interface Logger : NSObject {
}

+ (void) logMove:(Move*)move;
+ (void) logMoves:(NSArray *)moves;
+ (void) logMoves:(NSArray*)moves :(Piece*)piece;
+ (void) logSquare:(Square*)square;
+ (void) logPiece:(Square*)square :(Piece*)piece;

@end
