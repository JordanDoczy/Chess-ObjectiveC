//
//  ChessSquare.h
//  Chess
//
//  Created by Jordan Doczy on 3/27/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColumnEnum.h"
#import "Piece.h"
#import "RowEnum.h"

@interface ChessSquare : NSObject {

}

@property (nonatomic, retain) Piece *piece;
@property (nonatomic) ColumnEnum column;
@property (nonatomic) RowEnum row;



- (id) init:(ColumnEnum)_column :(RowEnum)_row;

@end
