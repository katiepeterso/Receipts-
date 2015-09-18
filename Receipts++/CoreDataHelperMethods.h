//
//  CoreDataHelperMethods.h
//  Receipts++
//
//  Created by Katherine Peterson on 2015-09-17.
//  Copyright © 2015 KatieExpatriated. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Receipt;

@interface CoreDataHelperMethods : NSObject

+(void)saveNewReceipt:(Receipt *)receipt;
+(void)saveTags;

@end
