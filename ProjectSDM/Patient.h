//
//  Patient.h
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/26/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Patient : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSDate * dateOfBirth;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * fatherName;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * mobileNumber;
@property (nonatomic, retain) NSSet *visits;
@end

@interface Patient (CoreDataGeneratedAccessors)

- (void)addVisitsObject:(NSManagedObject *)value;
- (void)removeVisitsObject:(NSManagedObject *)value;
- (void)addVisits:(NSSet *)values;
- (void)removeVisits:(NSSet *)values;

@end
