//
//  BoardView.h
//  app3
//
//  Created by Jordan Doczy on 3/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class History;
@class Piece;

@interface BoardView : UIView {}

- (void) addPiece:(Piece*)piece :(int)column :(int)row;
- (void) drawBoard;
- (id)   init;
- (id)   initWithModel:(History*)history;
- (void) removeAllImages;

+ (int) getColumnFromTouch:(UITouch *)touch;
+ (int) getRowFromTouch:(UITouch *)touch;

@end
