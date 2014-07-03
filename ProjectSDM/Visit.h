//
//  Visit.h
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/26/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Patient;

@interface Visit : NSManagedObject

@property (nonatomic, retain) NSNumber * billAmount;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) Patient *patient;

@end
