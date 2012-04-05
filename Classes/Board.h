//
//  Board.h
//  Chess
//
//  Created by Jordan Doczy on 4/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Piece.h"

@interface Board : NSObject { }

- (void) clearSquare:(int)index;
- (void) clearSquare:(int)column :(int)row;
- (id) copyWithZone:(NSZone *)zone;
+ (int) getColumn:(int)index;
+ (int) getIndex:(int)column :(int)row;
+ (int) getRow:(int)index;
- (id) getSquare:(int)index;
- (id) getSquare:(int)column :(int)row;
- (id) init;
- (void) initSquares;
- (void) setSquare:(int)index :(Piece*)piece;
- (void) setSquare:(int)column :(int)row :(Piece*)piece;

@property (nonatomic, retain) NSMutableArray *squares;
	
@end
