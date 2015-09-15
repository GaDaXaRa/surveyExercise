//
//  SurveyDatasource.m
//  SurveyExercise
//
//  Created by Miguel Santiago Rodríguez on 15/9/15.
//  Copyright (c) 2015 Miguel Santiago Rodríguez. All rights reserved.
//

#import "SurveyDatasource.h"

@implementation SurveyDatasource

- (NSDictionary *)fetchSurvey {
    return @{@"preguntas":@[
                     @{@"cual es tu comida favorita?" : @[@"paella", @"tortilla", @"hamburguesa"]},
                     @{@"cual es tu cerveza favorita?" : @[@"mahou", @"estrella de galicia"]},
                     @{@"que postura usas para dormir?" : @[@"boca arriba", @"boca abajo", @"de lado"]},
                     @{@"donde te gustaria ir de vacaciones?" : @[@"Nueva York", @"Bora bora", @"Australia"]}
                     ]
             };
}

@end
