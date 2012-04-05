//
//  PieceFactory.h
//  app3
//
//  Created by Jordan Doczy on 3/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorEnum.h"
#import "PieceEnum.h"


@interface PieceFactory : NSObject {

}

+ (id) createPiece:(PieceEnum)piece :(ColorEnum)color;


@end