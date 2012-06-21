//
//  Move.h
//  Chess
//
//  Created by Jordan Doczy on 4/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"

@interface Move : NSObject {
}

@property (nonatomic, retain) Square *fromSquare;
@property (nonatomic, retain) Square *toSquare;

- (id) init:(ColumnEnum)fromColumn :(RowEnum)fromRow :(ColumnEnum)toColumn :(RowEnum)toRow;
- (id) initWithSquares:(Square*)_fromSquare :(Square*)_toSquare;
- (void) reset;
- (void) test:(Square*)s;

	
@end
