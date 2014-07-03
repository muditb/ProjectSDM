//
//  Diagnosis.h
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/26/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Symptoms;

@interface Diagnosis : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSSet *symptoms;
@end

@interface Diagnosis (CoreDataGeneratedAccessors)

- (void)addSymptomsObject:(Symptoms *)value;
- (void)removeSymptomsObject:(Symptoms *)value;
- (void)addSymptoms:(NSSet *)values;
- (void)removeSymptoms:(NSSet *)values;

@end
