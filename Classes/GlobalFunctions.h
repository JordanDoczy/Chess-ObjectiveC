//
//  GlobalFunctions.h
//  app3
//
//  Created by Jordan Doczy on 3/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ColorEnum.h"
#import "ColumnEnum.h"
#import "RowEnum.h"
#import "PieceEnum.h"

@interface GlobalFunctions : NSObject {

}

+ (NSString*) colorEnumToString:(ColorEnum)color;
+ (NSString*) columnEnumToString:(ColumnEnum)column;
+ (NSString*) pieceEnumToString:(PieceEnum)piece;
+ (NSString*) rowEnumToString:(RowEnum)row;

+ (int) getColumnFromTouch:(UITouch *)touch;
+ (int) getRowFromTouch:(UITouch *)touch;

@end
