//
//  Medications.h
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/26/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Medications : NSManagedObject

@property (nonatomic, retain) NSString * brandName;
@property (nonatomic, retain) NSString * company;
@property (nonatomic, retain) NSDecimalNumber * composition;
@property (nonatomic, retain) NSString * type;

@end
