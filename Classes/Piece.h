//
//  Piece.h
//  app3
//
//  Created by Jordan Doczy on 3/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorEnum.h"

@class Move;
@class Board;

@interface Piece : NSObject {
	ColorEnum color;
	NSString *name;
	BOOL moved;
}


@property (nonatomic) ColorEnum color;
@property (nonatomic, retain) NSString *name;
@property (nonatomic) BOOL moved;

- (id) copyWithZone:(NSZone *)zone;
- (NSString*)display;
- (id) init:(ColorEnum)_color;
- (BOOL) isValidMove:(Move *)move :(Board *)board;
- (BOOL) isCaptureAttempt:(Piece *)piece;


@end
