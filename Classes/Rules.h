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
- (BOOL) isCaptureAttempt:(Move *)move :(Board *)board :(Piece *)from;
- (BOOL) isCorrectColor:(ColorEnum)color;
- (BOOL) isKingInCheck:(Move *)move;
- (BOOL) isKingInCheck:(Move *)move :(Board*)board :(Piece*)from;
- (BOOL) isToEmpty:(Move *)move;
- (BOOL) isValidCastle:(Move *)move;
- (BOOL) isValidCastle:(Move *)move :(Board*)board :(Piece*)king;
- (BOOL) isValidCastle:(Move *)move :(Board*)board :(Piece*)king :(Piece*)rook;

- (BOOL) isValidMove:(Move *)move;
- (BOOL) isValidMove:(Move *)move :(Board*)board :(Piece*)from;

@end
