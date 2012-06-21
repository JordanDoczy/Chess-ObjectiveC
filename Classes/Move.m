//
//  Move.m
//  Chess
//
//  Created by Jordan Doczy on 4/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Move.h"

@implementation Move

@synthesize fromSquare;
@synthesize toSquare;

- (id) init:(ColumnEnum)fromColumn :(RowEnum)fromRow :(ColumnEnum)toColumn :(RowEnum)toRow{
	fromSquare = [[Square alloc] init: fromColumn :fromRow];
	toSquare = [[Square alloc] init: toColumn :toRow];;
	return self;
}

- (id) initWithSquares:(Square*)_fromSquare :(Square*)_toSquare{
	fromSquare = _fromSquare;
	toSquare = _toSquare;
	return self;
}

- (void) test:(Square*)s{
}

- (void) reset{
	[fromSquare reset];
	[toSquare reset];
}

@end
