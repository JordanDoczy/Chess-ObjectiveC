//
//  BoardView.h
//  app3
//
//  Created by Jordan Doczy on 3/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChessSquare.h"
#import "ColumnEnum.h"
#import "History.h"
#import "RowEnum.h"

@interface BoardView : UIView {}

- (void) addPiece:(Piece*)piece :(int)column :(int)row;
- (void) drawBoard;
- (id)   init;
- (id)   initWithModel:(History*)history;
- (void) removeAllImages;

@end
