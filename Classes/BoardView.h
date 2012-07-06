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
@class Move;

@interface BoardView : UIView {

	Move *currentMove;

}
- (void) addPiece:(Piece*)piece :(int)column :(int)row;
- (Move*) currentMove;
- (void) drawBoard;
- (id)   init;
- (id)   initWithModel:(History*)history;
- (void) removeAllImages;
- (void) setCurrentMove:(Move*)currentMoveValue;


@end
