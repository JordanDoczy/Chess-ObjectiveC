//
//  Rules.h
//  Chess
//
//  Created by Jordan Doczy on 4/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Board;
@class History;
@class Move;
@class Piece;


@interface Rules : NSObject {

}

- (id) initWithModel:(History *)history;
- (BOOL) isCaptureAttempt:(Move *)move;
- (BOOL) isCorrectColor:(ColorEnum)color;
- (BOOL) isToEmpty:(Move *)move;
- (BOOL) isValidMove:(Move *)move;
- (BOOL) isKingInCheck:(Move *)move;
- (BOOL) isValidCastle:(Move *)move;

@end
