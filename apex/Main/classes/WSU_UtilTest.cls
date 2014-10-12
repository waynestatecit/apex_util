// This file is part of WSU_Util, a set of generic Apex utilities for the Force.com platform.
//
// Copyright 2013-2014, Wayne State University
// License: 3-clause BSD license.  See LICENSE.

@isTest
public class WSU_UtilTest {

    // createOrAdd
    static testMethod void createOrAddObjectTest1StringValueSameKey() {
        Map<String, List<String>> aMap = new Map<String, List<String>>{'keyone' => new List<String>{'valueone', 'valuetwo'}};
        WSU_Util.sCreateOrAdd(aMap, 'keyone', 'valuethree');

        System.assertEquals(aMap.size(), 1);
        System.assert(aMap.containsKey('keyone'));
        List<String> values = aMap.get('keyone');
        values.sort();
        List<String> expectedValues = new List<String>{'valueone', 'valuetwo', 'valuethree'};
        expectedValues.sort();
        System.assertEquals(values.size(), expectedValues.size());
        for (Integer i = 0; i < values.size(); i++) {
            System.assertEquals(values.get(i), expectedValues.get(i));
        }
    }

    static testMethod void createOrAddObjectTest2StringValueSameKeyInstance() {
        WSU_Util u = new WSU_Util();

        Map<String, List<String>> aMap = new Map<String, List<String>>{'keyone' => new List<String>{'valueone', 'valuetwo'}};
        u.createOrAdd(aMap, 'keyone', 'valuethree');

        System.assertEquals(aMap.size(), 1);
        System.assert(aMap.containsKey('keyone'));
        List<String> values = aMap.get('keyone');
        values.sort();
        List<String> expectedValues = new List<String>{'valueone', 'valuetwo', 'valuethree'};
        expectedValues.sort();
        System.assertEquals(values.size(), expectedValues.size());
        for (Integer i = 0; i < values.size(); i++) {
            System.assertEquals(values.get(i), expectedValues.get(i));
        }
    }

    static testMethod void createOrAddObjectTest3IntegerValueSameKey() {
        Map<String, List<Integer>> aMap = new Map<String, List<Integer>>{'keyone' => new List<Integer>{10, 11}};
        WSU_Util.sCreateOrAdd(aMap, 'keyone', 42);

        System.assertEquals(aMap.size(), 1);
        System.assert(aMap.containsKey('keyone'));
        List<Integer> values = aMap.get('keyone');
        values.sort();
        List<Integer> expectedValues = new List<Integer>{10, 11, 42};
        expectedValues.sort();
        System.assertEquals(values.size(), expectedValues.size());
        for (Integer i = 0; i < values.size(); i++) {
            System.assertEquals(values.get(i), expectedValues.get(i));
        }
    }

    static testMethod void createOrAddObjectTest4StringValueNewKey() {
        Map<String, List<String>> aMap = new Map<String, List<String>>{'keyone' => new List<String>{'valueone', 'valuetwo'}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', 'valuethree');

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<String> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<String> expectedValuesOne = new List<String>{'valueone', 'valuetwo'};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<String> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<String> expectedValuesTwo = new List<String>{'valuethree'};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest4_1StringValueNewKey() {
        Map<String, List<String>> aMap = new Map<String, List<String>>{'keyone' => new List<String>{null, 'valuetwo'}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', 'valuethree');

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<String> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<String> expectedValuesOne = new List<String>{'valuetwo', null};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<String> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<String> expectedValuesTwo = new List<String>{'valuethree'};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest4_2StringValueNewKey() {
        Map<String, List<String>> aMap = new Map<String, List<String>>{'keyone' => new List<String>{null, null}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', (Object)null);

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<String> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<String> expectedValuesOne = new List<String>{null, null};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<String> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<String> expectedValuesTwo = new List<String>{null};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest5IntegerValueNewKey() {
        Map<String, List<Integer>> aMap = new Map<String, List<Integer>>{'keyone' => new List<Integer>{98, 47}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', 234);

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<Integer> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<Integer> expectedValuesOne = new List<Integer>{98, 47};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<Integer> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<Integer> expectedValuesTwo = new List<Integer>{234};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest6LongValueNewKey() {
        Map<String, List<Long>> aMap = new Map<String, List<Long>>{'keyone' => new List<Long>{98, 47}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', 234);

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<Long> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<Long> expectedValuesOne = new List<Long>{98, 47};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<Long> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<Long> expectedValuesTwo = new List<Long>{234};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest7DecimalValueNewKey() {
        Map<String, List<Decimal>> aMap = new Map<String, List<Decimal>>{'keyone' => new List<Decimal>{23423.123, 12.5663}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', 8787.78);

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<Decimal> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<Decimal> expectedValuesOne = new List<Decimal>{23423.123, 12.5663};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<Decimal> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<Decimal> expectedValuesTwo = new List<Decimal>{8787.78};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest8DoubleValueNewKey() {
        Map<String, List<Double>> aMap = new Map<String, List<Double>>{'keyone' => new List<Double>{23423.123, 12.5663}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', 8787.78);

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<Double> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<Double> expectedValuesOne = new List<Double>{23423.123, 12.5663};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<Double> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<Double> expectedValuesTwo = new List<Double>{8787.78};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest9BooleanValueNewKey() {
        Map<String, List<Boolean>> aMap = new Map<String, List<Boolean>>{'keyone' => new List<Boolean>{true, false}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', false);

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<Boolean> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<Boolean> expectedValuesOne = new List<Boolean>{true, false};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<Boolean> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<Boolean> expectedValuesTwo = new List<Boolean>{false};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest9_1BooleanValueNewKey() {
        Map<String, List<Boolean>> aMap = new Map<String, List<Boolean>>{'keyone' => new List<Boolean>{true, null}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', false);

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<Boolean> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<Boolean> expectedValuesOne = new List<Boolean>{null, true};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<Boolean> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<Boolean> expectedValuesTwo = new List<Boolean>{false};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest10IDValueNewKey() {
        Contact con1 = new Contact(LastName = 'TEST1');
        Contact con2 = new Contact(LastName = 'TEST2');
        Contact con3 = new Contact(LastName = 'TEST3');
        List<Database.SaveResult> results = Database.insert(new List<Contact>{con1, con2, con3});

        Map<String, List<ID>> aMap = new Map<String, List<ID>>{'keyone' => new List<ID>{results.get(0).getId(), results.get(1).getId()}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', results.get(2).getId());

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<ID> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<ID> expectedValuesOne = new List<ID>{results.get(1).getId(), results.get(0).getId()};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<ID> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<ID> expectedValuesTwo = new List<ID>{results.get(2).getId()};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest11DateValueNewKey() {
        Map<String, List<Date>> aMap = new Map<String, List<Date>>{'keyone' => new List<Date>{Date.newInstance(2010, 1, 15), Date.today()}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', Date.today().addDays(-20));

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<Date> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<Date> expectedValuesOne = new List<Date>{Date.newInstance(2010, 1, 15), Date.today()};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<Date> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<Date> expectedValuesTwo = new List<Date>{Date.today().addDays(-20)};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest12TimeValueNewKey() {
        Map<String, List<Time>> aMap = new Map<String, List<Time>>{'keyone' => new List<Time>{Time.newInstance(18, 24, 12, 98), Time.newInstance(4, 0, 41, 291)}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', Time.newInstance(19, 59, 0, 0));

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<Time> valuesOne = aMap.get('keyone');
        List<Time> expectedValuesOne = new List<Time>{Time.newInstance(18, 24, 12, 98), Time.newInstance(4, 0, 41, 291)};
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<Time> valuesTwo = aMap.get('keytwo');
        List<Time> expectedValuesTwo = new List<Time>{Time.newInstance(19, 59, 0, 0)};
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest13DatetimeValueNewKey() {
        Map<String, List<Datetime>> aMap = new Map<String, List<Datetime>>{'keyone' => new List<Datetime>{Datetime.newInstance(2009, 12, 12, 18, 24, 12), Datetime.newInstance(2008, 1, 2, 4, 0, 41)}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', Datetime.newInstance(1979, 10, 1, 19, 59, 0));

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<Datetime> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<Datetime> expectedValuesOne = new List<Datetime>{Datetime.newInstance(2009, 12, 12, 18, 24, 12), Datetime.newInstance(2008, 1, 2, 4, 0, 41)};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<Datetime> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<Datetime> expectedValuesTwo = new List<Datetime>{Datetime.newInstance(1979, 10, 1, 19, 59, 0)};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTest14BlobValueNewKey() {
        Map<String, List<Blob>> aMap = new Map<String, List<Blob>>{'keyone' => new List<Blob>{Blob.valueOf('astringone'), null}};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', Blob.valueOf('astringthree'));

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<Blob> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<Blob> expectedValuesOne = new List<Blob>{null, Blob.valueOf('astringone')};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            if (!(valuesOne.get(i) == null && expectedValuesOne.get(i) == null)) {
                System.assertEquals(valuesOne.get(i).toString(), expectedValuesOne.get(i).toString());
            }
        }
        List<Blob> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<Blob> expectedValuesTwo = new List<Blob>{Blob.valueOf('astringthree')};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i).toString(), expectedValuesTwo.get(i).toString());
        }
    }

    static testMethod void createOrAddObjectTestNesting1NewKey() {
        Map<String, List<String>> aMap = new Map<String, List<String>>{'keyone' => new List<String>{'astringone', null}};
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'keytwo'}, 'astringthree');

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        System.assert(aMap.containsKey('keytwo'));
        List<String> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<String> expectedValuesOne = new List<String>{null, 'astringone'};
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<String> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<String> expectedValuesTwo = new List<String>{'astringthree'};
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddObjectTestNesting2NewKeyCauseException() {
        Map<String, List<String>> aMap = new Map<String, List<String>>{'keyone' => new List<String>{'astringone', null}};

        Boolean caughtOne = false;
        try {
            WSU_Util.sCreateOrAdd(aMap, new List<String>(), 'astringthree');
        } catch (WSU_Util.UtilException e) {
            caughtOne = true;
        }

        System.assert(caughtOne);
    }

    static testMethod void createOrAddObjectTestNesting4NewKeyTwoLayerMap() {
        Map<String, Object> aMap = new Map<String, Object>{'outerkeyone' => (Object)(new Map<String, List<Object>>{'innerkeyone' => new List<Object>{'astringone', null}})};
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'outerkeytwo', 'innerkeyone'}, 'astringthree');

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('outerkeyone'));
        System.assert(aMap.containsKey('outerkeytwo'));
        Map<String, List<Object>> valuesOne = (Map<String, List<Object>>)aMap.get('outerkeyone');
        Map<String, List<Object>> expectedValuesOne = new Map<String, List<Object>>{'innerkeyone' => new List<Object>{'astringone', null}};
        System.assertEquals(valuesOne, expectedValuesOne);
        Map<String, List<Object>> valuesTwo = (Map<String, List<Object>>)aMap.get('outerkeytwo');
        Map<String, List<Object>> expectedValuesTwo = new Map<String, List<Object>>{'innerkeyone' => new List<Object>{'astringthree'}};
        System.assertEquals(valuesTwo, expectedValuesTwo);
    }

    static testMethod void createOrAddObjectTestNesting5NewKeyTwoLayerMapMixedType() {
        Map<String, Object> aMap = new Map<String, Object>{'outerkeyone' => (Object)(new Map<String, List<Object>>{'innerkeyone' => new List<Object>{'astringone', 2}})};
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'outerkeytwo', 'innerkeyone'}, 'astringthree');

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('outerkeyone'));
        System.assert(aMap.containsKey('outerkeytwo'));
        Map<String, List<Object>> valuesOne = (Map<String, List<Object>>)aMap.get('outerkeyone');
        Map<String, List<Object>> expectedValuesOne = new Map<String, List<Object>>{'innerkeyone' => new List<Object>{'astringone', 2}};
        System.assertEquals(valuesOne, expectedValuesOne);
        Map<String, List<Object>> valuesTwo = (Map<String, List<Object>>)aMap.get('outerkeytwo');
        Map<String, List<Object>> expectedValuesTwo = new Map<String, List<Object>>{'innerkeyone' => new List<Object>{'astringthree'}};
        System.assertEquals(valuesTwo, expectedValuesTwo);
    }

    static testMethod void createOrAddObjectTestNesting6SameKeysTwoLayerMap() {
        Map<String, Object> aMap = new Map<String, Object>{'outerkeyone' => (Object)(new Map<String, List<Object>>{'innerkeyone' => new List<Object>{'astringone', 2}})};
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'outerkeyone', 'innerkeyone'}, 'astringthree');

        System.assertEquals(aMap.size(), 1);
        System.assert(aMap.containsKey('outerkeyone'));
        Map<String, List<Object>> valuesOne = (Map<String, List<Object>>)aMap.get('outerkeyone');
        Map<String, List<Object>> expectedValuesOne = new Map<String, List<Object>>{'innerkeyone' => new List<Object>{'astringone', 2, 'astringthree'}};
        System.assertEquals(valuesOne, expectedValuesOne);
    }

    static testMethod void createOrAddObjectTestNesting7NewInnerKeyTwoLayerMap() {
        Map<String, Object> aMap = new Map<String, Object>{'outerkeyone' => (Object)(new Map<String, List<Object>>{'innerkeyone' => new List<Object>{'astringone', 2}})};
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'outerkeyone', 'innerkeytwo'}, 'astringthree');

        System.assertEquals(aMap.size(), 1);
        System.assert(aMap.containsKey('outerkeyone'));
        Map<String, List<Object>> valuesOne = (Map<String, List<Object>>)aMap.get('outerkeyone');
        Map<String, List<Object>> expectedValuesOne = new Map<String, List<Object>>{'innerkeyone' => new List<Object>{'astringone', 2}, 'innerkeytwo' => new List<Object>{'astringthree'}};
        System.assertEquals(valuesOne, expectedValuesOne);
    }

    static testMethod void createOrAddObjectTestNesting8BuildABigMap() {
        Map<String, Object> aMap = new Map<String, Object>();
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'1_1', '2_1', '3_1', '4_1'}, 'value11111');
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'1_1', '2_1', '3_1', '4_1'}, 'value11112');
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'1_1', '2_1', '3_1', '4_2'}, 'value11121');
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'1_1', '2_1', '3_1', '4_2'}, 'value11122');
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'1_1', '2_1', '3_2', '4_1'}, 'value11211');
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'1_1', '2_2', '3_1', '4_1'}, 'value12111');
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'1_1', '2_2', '3_1', '4_2'}, 'value12121');
        WSU_Util.sCreateOrAdd(aMap, new List<String>{'1_1', '2_2', '3_1', '4_2'}, 'value12122');

        Map<String, Object> expectedResult = new Map<String, Object>{
            '1_1' => (Object)(new Map<String, Object>{
                '2_1' => (Object)(new Map<String, Object>{
                    '3_1' => (Object)(new Map<String, Object>{
                        '4_1' => (Object)(new List<Object>{
                            'value11111',
                            'value11112'
                        }),
                        '4_2' => (Object)(new List<Object>{
                            'value11121',
                            'value11122'
                        })
                    }),
                    '3_2' => (Object)(new Map<String, Object>{
                        '4_1' => (Object)(new List<Object>{
                            'value11211'
                        })
                    })
                }),
                '2_2' => (Object)(new Map<String, Object>{
                    '3_1' => (Object)(new Map<String, Object>{
                        '4_1' => (Object)(new List<Object>{
                            'value12111'
                        }),
                        '4_2' => (Object)(new List<Object>{
                            'value12121',
                            'value12122'
                        })
                    })
                })
            })
        };
        System.assertEquals(aMap, expectedResult);

    }

    static testMethod void createOrAddSObjectTest1SameKey() {
        Map<String, List<sObject>> aMap = new Map<String, List<sObject>>{'keyone' => new List<sObject>{
            new Contact(LastName = 'TEST1'),
            new Contact(LastName = 'TEST2')
        }};
        WSU_Util.sCreateOrAdd(aMap, 'keyone', new Contact(LastName = 'TEST3'));

        System.assertEquals(aMap.size(), 1);
        System.assert(aMap.containsKey('keyone'));
        List<sObject> values = aMap.get('keyone');
        values.sort();
        List<sObject> expectedValues = new List<sObject>{
            new Contact(LastName = 'TEST1'),
            new Contact(LastName = 'TEST2'),
            new Contact(LastName = 'TEST3')
        };
        expectedValues.sort();
        System.assertEquals(values.size(), expectedValues.size());
        for (Integer i = 0; i < values.size(); i++) {
            System.assertEquals(values.get(i), expectedValues.get(i));
        }
    }

    static testMethod void createOrAddSObjectTest2SameKeyInstance() {
        WSU_Util u = new WSU_Util();

        Map<String, List<sObject>> aMap = new Map<String, List<sObject>>{'keyone' => new List<sObject>{
            new Contact(LastName = 'TEST1'),
            new Contact(LastName = 'TEST2')
        }};
        u.createOrAdd(aMap, 'keyone', new Contact(LastName = 'TEST3'));

        System.assertEquals(aMap.size(), 1);
        System.assert(aMap.containsKey('keyone'));
        List<sObject> values = aMap.get('keyone');
        values.sort();
        List<sObject> expectedValues = new List<sObject>{
            new Contact(LastName = 'TEST1'),
            new Contact(LastName = 'TEST2'),
            new Contact(LastName = 'TEST3')
        };
        expectedValues.sort();
        System.assertEquals(values.size(), expectedValues.size());
        for (Integer i = 0; i < values.size(); i++) {
            System.assertEquals(values.get(i), expectedValues.get(i));
        }
    }

    static testMethod void createOrAddSObjectTest3NewKey() {
        Map<String, List<sObject>> aMap = new Map<String, List<sObject>>{'keyone' => new List<sObject>{
            new Contact(LastName = 'TEST1'),
            new Contact(LastName = 'TEST2')
        }};
        WSU_Util.sCreateOrAdd(aMap, 'keytwo', new Contact(LastName = 'TEST3'));

        System.assertEquals(aMap.size(), 2);
        System.assert(aMap.containsKey('keyone'));
        List<sObject> valuesOne = aMap.get('keyone');
        valuesOne.sort();
        List<sObject> expectedValuesOne = new List<sObject>{
            new Contact(LastName = 'TEST1'),
            new Contact(LastName = 'TEST2')
        };
        expectedValuesOne.sort();
        System.assertEquals(valuesOne.size(), expectedValuesOne.size());
        for (Integer i = 0; i < valuesOne.size(); i++) {
            System.assertEquals(valuesOne.get(i), expectedValuesOne.get(i));
        }
        List<sObject> valuesTwo = aMap.get('keytwo');
        valuesTwo.sort();
        List<sObject> expectedValuesTwo = new List<sObject>{
            new Contact(LastName = 'TEST3')
        };
        expectedValuesTwo.sort();
        System.assertEquals(valuesTwo.size(), expectedValuesTwo.size());
        for (Integer i = 0; i < valuesTwo.size(); i++) {
            System.assertEquals(valuesTwo.get(i), expectedValuesTwo.get(i));
        }
    }

    static testMethod void createOrAddSObjectTestNesting1BuildASmallMap() {
        List<Contact> cons = new List<Contact>();
        for (Integer i = 0; i < 2; i++) {
            cons.add(new Contact(LastName = 'LASTNAME' + String.valueOf(i), Email = 'blah'+String.valueOf(Math.mod(i, 2))+'@email.com'));
        }

        Map<String, Object> aMap = new Map<String, Object>();
        for (Contact con : cons) {
            aMap = WSU_Util.sCreateOrAdd(aMap, new List<String>{con.Email}, con);
        }

        Map<String, Object> expectedResult = new Map<String, Object>{
            'blah0@email.com' => (Object)(new List<Object>{(Object)new Contact(LastName = 'LASTNAME0', Email = 'blah0@email.com')}),
            'blah1@email.com' => (Object)(new List<Object>{(Object)new Contact(LastName = 'LASTNAME1', Email = 'blah1@email.com')})
        };

        System.assertEquals(aMap, expectedResult);
    }

    static testMethod void createOrAddSObjectTestNesting2BuildASmallMap() {
        List<Contact> cons = new List<Contact>();
        for (Integer i = 0; i < 2; i++) {
            cons.add(new Contact(LastName = 'LASTNAME' + String.valueOf(i), Email = 'blah'+String.valueOf(Math.mod(i, 2))+'@email.com'));
        }

        Map<String, Object> aMap = new Map<String, Object>();
        for (Contact con : cons) {
            aMap = WSU_Util.sCreateOrAdd(aMap, new List<String>{con.Email, con.LastName}, con);
        }

        Map<String, Object> expectedResult = new Map<String, Object>{
            'blah0@email.com' => (Object)(new Map<String, Object>{
                'LASTNAME0' => (Object)(new List<Object>{
                    (Object)new Contact(LastName = 'LASTNAME0', Email = 'blah0@email.com')
                })
            }),
            'blah1@email.com' => (Object)(new Map<String, Object>{
                'LASTNAME1' => (Object)(new List<Object>{
                    (Object)new Contact(LastName = 'LASTNAME1', Email = 'blah1@email.com')
                })
            })
        };

        System.assertEquals(aMap, expectedResult);

    }

    static testMethod void createOrAddSObjectTestNesting3BuildABigMap() {
        List<Contact> cons = new List<Contact>();
        for (Integer i = 0; i < 60; i++) {
            cons.add(new Contact(
                FirstName = 'FIRSTNAME' + String.valueOf(i),
                LastName = 'LASTNAME' + String.valueOf(Math.mod(i, 4)),
                Email = 'blah'+String.valueOf(Math.mod(i, 2))+'@email.com'
            ));
        }

        Map<String, Object> aMap = new Map<String, Object>();
        for (Contact con : cons) {
            aMap = WSU_Util.sCreateOrAdd(aMap, new List<String>{con.Email, con.LastName}, con);
        }

        Map<String, Object> expectedResult = new Map<String, Object>{
            'blah0@email.com' => (Object)(new Map<String, Object>{
                'LASTNAME0' => (Object)(new List<Object>{
                    (Object)new Contact(FirstName = 'FIRSTNAME0', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME4', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME8', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME12', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME16', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME20', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME24', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME28', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME32', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME36', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME40', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME44', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME48', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME52', LastName = 'LASTNAME0', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME56', LastName = 'LASTNAME0', Email = 'blah0@email.com')
                }),
                'LASTNAME2' => (Object)(new List<Object>{
                    (Object)new Contact(FirstName = 'FIRSTNAME2', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME6', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME10', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME14', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME18', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME22', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME26', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME30', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME34', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME38', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME42', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME46', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME50', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME54', LastName = 'LASTNAME2', Email = 'blah0@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME58', LastName = 'LASTNAME2', Email = 'blah0@email.com')
                })
            }),
            'blah1@email.com' => (Object)(new Map<String, Object>{
                'LASTNAME1' => (Object)(new List<Object>{
                    (Object)new Contact(FirstName = 'FIRSTNAME1', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME5', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME9', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME13', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME17', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME21', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME25', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME29', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME33', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME37', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME41', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME45', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME49', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME53', LastName = 'LASTNAME1', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME57', LastName = 'LASTNAME1', Email = 'blah1@email.com')
                }),
                'LASTNAME3' => (Object)(new List<Object>{
                    (Object)new Contact(FirstName = 'FIRSTNAME3', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME7', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME11', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME15', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME19', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME23', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME27', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME31', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME35', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME39', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME43', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME47', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME51', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME55', LastName = 'LASTNAME3', Email = 'blah1@email.com'),
                    (Object)new Contact(FirstName = 'FIRSTNAME59', LastName = 'LASTNAME3', Email = 'blah1@email.com')
                })
            })
        };

        System.assertEquals(aMap, expectedResult);

    }

    static testMethod void createOrAddSObjectTestNesting4BuildASmallMapInstance() {
        WSU_Util u = new WSU_Util();
        List<Contact> cons = new List<Contact>();
        for (Integer i = 0; i < 2; i++) {
            cons.add(new Contact(LastName = 'LASTNAME' + String.valueOf(i), Email = 'blah'+String.valueOf(Math.mod(i, 2))+'@email.com'));
        }

        Map<String, Object> aMap = new Map<String, Object>();
        for (Contact con : cons) {
            aMap = u.createOrAdd(aMap, new List<String>{con.Email}, con);
        }

        Map<String, Object> expectedResult = new Map<String, Object>{
            'blah0@email.com' => (Object)(new List<Object>{(Object)new Contact(LastName = 'LASTNAME0', Email = 'blah0@email.com')}),
            'blah1@email.com' => (Object)(new List<Object>{(Object)new Contact(LastName = 'LASTNAME1', Email = 'blah1@email.com')})
        };

        System.assertEquals(aMap, expectedResult);
    }

    // Merging
    static testMethod void mergeTestEmptySource() {
        Map<String, Object> toUpdate = new Map<String, Object>{
            'one' => 1,
            'two' => 2
        };
        Map<String, Object> toTest = toUpdate.clone();

        Map<String, Object> source = new Map<String, Object>{
        };

        WSU_Util.sMrge(toUpdate, source);

        System.assert(toUpdate.equals(toTest));
    }

    static testMethod void mergeTestBothEmpty() {
        Map<String, Object> toUpdate = new Map<String, Object>{
        };
        Map<String, Object> toTest = toUpdate.clone();

        Map<String, Object> source = new Map<String, Object>{
        };

        WSU_Util.sMrge(toUpdate, source);

        System.assert(toUpdate.equals(toTest));
    }

    static testMethod void mergeTestEmptyToUpdate() {
        Map<String, Object> toUpdate = new Map<String, Object>{
        };

        Map<String, Object> source = new Map<String, Object>{
            'one' => 1,
            'two' => 2
        };
        Map<String, Object> toTest = source.clone();

        WSU_Util.sMrge(toUpdate, source);

        System.assert(toUpdate.equals(toTest));
    }

    static testMethod void mergeTestScalarContents() {
        Map<String, Object> toUpdate = new Map<String, Object>{
            'one' => 1,
            'two' => 2
        };

        Map<String, Object> source = new Map<String, Object>{
            'one' => 'ten',
            'three' => null
        };

        WSU_Util.sMrge(toUpdate, source);

        System.assert(toUpdate.equals(new Map<String, Object>{
            'one' => 'ten',
            'two' => 2,
            'three' => null
        }));
    }

    static testMethod void mergeTestSetClobberDefault() {
        Map<String, Object> toUpdate = new Map<String, Object>{
            'one' => 1,
            'two' => (Object)new Set<Object>{'four', 'four', 45.0},
            'three' => 2
        };

        Map<String, Object> source = new Map<String, Object>{
            'one' => 'ten',
            'two' => true
        };

        WSU_Util.sMrge(toUpdate, source);

        System.assert(toUpdate.equals(new Map<String, Object>{
            'one' => 'ten',
            'two' => true,
            'three' => 2
        }));
    }

    static testMethod void mergeTestSetClobberFalse() {
        Map<String, Object> toUpdate = new Map<String, Object>{
            'one' => 1,
            'two' => (Object)new Set<Object>{'four', 'four', 45.0},
            'three' => 2
        };

        Map<String, Object> source = new Map<String, Object>{
            'one' => 'ten',
            'two' => true
        };

        WSU_Util.sMrge(toUpdate, source, false);

        System.assert(toUpdate.equals(new Map<String, Object>{
            'one' => 'ten',
            'two' => (Object)new Set<Object>{'four', 45.0},
            'three' => 2
        }));
    }

    static testMethod void mergeTestSet() {
        Map<String, Object> toUpdate = new Map<String, Object>{
            'one' => 1,
            'two' => (Object)new Set<Object>{'four', 'four', 45.0},
            'three' => 2
        };

        Map<String, Object> source = new Map<String, Object>{
            'one' => 'ten',
            'two' => (Object)new Set<Object>{'teststring', false, 'four', 12}
        };

        WSU_Util.sMrge(toUpdate, source, false);

        System.assert(toUpdate.equals(new Map<String, Object>{
            'one' => 'ten',
            'two' => (Object)new Set<Object>{'four', 45.0, 'teststring', false, 12},
            'three' => 2
        }));
    }

    static testMethod void mergeTestList() {
        Map<String, Object> toUpdate = new Map<String, Object>{
            'one' => 1,
            'two' => (Object)new List<Object>{'four', 'four', 45.0},
            'three' => 2
        };

        Map<String, Object> source = new Map<String, Object>{
            'one' => 'ten',
            'two' => (Object)new List<Object>{'teststring', false, 'four', 12}
        };

        WSU_Util.sMrge(toUpdate, source, false);

        System.assert(toUpdate.equals(new Map<String, Object>{
            'one' => 'ten',
            'two' => (Object)new List<Object>{'four', 'four', 45.0, 'teststring', false, 'four', 12},
            'three' => 2
        }));
    }

    static testMethod void mergeTestMap() {
        Map<String, Object> toUpdate = new Map<String, Object>{
            'one' => 1,
            'two' => (Object)new Map<String, Object>{
                'four' => 44,
                'akey' => 45.0,
                'listkey' => (Object)new List<Object>{1, 'eight'}
            },
            'three' => 2
        };

        Map<String, Object> source = new Map<String, Object>{
            'one' => 'ten',
            'two' => (Object)new Map<String, Object>{
                'teststring' => false,
                'akey' => 'avalue',
                'listkey' => (Object)new List<Object>{1, 'niner'}
            }
        };

        WSU_Util.sMrge(toUpdate, source, false);

        System.assert(toUpdate.equals(new Map<String, Object>{
            'one' => 'ten',
            'two' => (Object)new Map<String, Object>{
                'four' => 44,
                'akey' => 'avalue',
                'teststring' => false,
                'listkey' => (Object)new List<Object>{1, 'eight', 1, 'niner'}
            },
            'three' => 2
        }));
    }

    // SOQL parsing
    static testMethod void soqlOne() {
        Map<String, Object> result = WSU_Util.parseSOQL('select Id from Contact where Name = :bindVar');

        System.assert(result.equals(new Map<String, Object>{
            'fields' => (Object)new List<Object>{'Id'},
            'from' => 'Contact'
            //'where' => (Object)new Map<String, Object>{
                //'size' => 1,
                //'clauses' => (Object)new List<Object>{
                    //(Object)new Map<String, Object>{
                        //'field' => 'Name',
                        //'operator' => '=',
                        //'value' => (Object)new Map<String, Object>{
                            //'type' => 'bind',
                            //'variable' => 'bindVar'
                        //}
                    //}
                //}
                // 'logic' => (Object)new List<Object>{'and', 0, 1, etc}
            //}
        }));
    }

    static testMethod void soqlFieldCustom() {
        Map<String, Object> result = WSU_Util.parseSOQL('select Name, Custom_Field__c, BirthDate from Custom__c where Name = :bindVar');

        System.assert(result.equals(new Map<String, Object>{
            'fields' => (Object)new List<Object>{'Name', 'Custom_Field__c', 'BirthDate'},
            'from' => 'Custom__c'
        }));
    }

    static testMethod void soqlFieldSubquery() {
        Map<String, Object> result = WSU_Util.parseSOQL('select Id, (select Id, Description from Cases), Name from Contact where Name = :bindVar');

        System.assert(result.equals(new Map<String, Object>{
            'fields' => (Object)new List<Object>{'Id', (Object)new Map<String, Object>{
                'fields' => (Object)new List<Object>{'Id', 'Description'},
                'from' => 'Cases'
            }, 'Name'},
            'from' => 'Contact'
        }));
    }

    static testMethod void soqlFieldChildToParent() {
        Map<String, Object> result = WSU_Util.parseSOQL('select Id, Name, Account.Name from Contact where Name = :bindVar');

        System.assert(result.equals(new Map<String, Object>{
            'fields' => (Object)new List<Object>{'Id', 'Name', 'Account.Name'},
            'from' => 'Contact'
        }));
    }

    static testMethod void testGetFieldNamesSingle() {
        Database.SaveResult saveResult = Database.insert(
            new Account(
                Name = 'TESTACCOUNT'
            )
        );
        saveResult = Database.insert(
            new Contact(
                LastName = 'TESTLAST1',
                FirstName = 'TESTFIRST1',
                Email = 'firstlast@email.com',
                AccountId = saveResult.getId()
            )
        );
        
        Contact con = [select Id, Email, LastName, FirstName, Account.Name from Contact limit 1];

        Map<String, Object> results = WSU_Util.getFieldNames(con);

        Map<String, Object> expectedResults = new Map<String, Object>{
            'Id' => null,
            'FirstName' => null,
            'LastName' => null,
            'Email' => null,
            'AccountId' => null,
            'Account' => (Object)new Map<String, Object>{
                'Id' => null,
                'Name' => null
            }
        };

        System.assert(results.equals(expectedResults));
    }

    static testMethod void testGetFieldNamesList() {
        Database.SaveResult saveResult = Database.insert(
            new Account(
                Name = 'TESTACCOUNT'
            )
        );
        saveResult = Database.insert(
            new Contact(
                LastName = 'TESTLAST1',
                FirstName = 'TESTFIRST1',
                Email = 'firstlast@email.com',
                AccountId = saveResult.getId()
            )
        );
        
        Contact con = [select Id, Email, LastName, FirstName, Account.Name from Contact limit 1];

        Map<String, Object> results = WSU_Util.getFieldNames(new List<sObject>{con});

        Map<String, Object> expectedResults = new Map<String, Object>{
            'Id' => null,
            'AccountId' => null,
            'FirstName' => null,
            'LastName' => null,
            'Email' => null,
            'Account' => (Object)new Map<String, Object>{
                'Name' => null,
                'Id' => null
            }
        };

        System.assert(results.equals(expectedResults));
    }

    static testMethod void testGetFieldNamesMap() {
        Database.SaveResult saveResult = Database.insert(
            new Account(
                Name = 'TESTACCOUNT'
            )
        );
        saveResult = Database.insert(
            new Contact(
                LastName = 'TESTLAST1',
                FirstName = 'TESTFIRST1',
                Email = 'firstlast@email.com',
                AccountId = saveResult.getId()
            )
        );
        
        Contact con = [select Id, Email, LastName, FirstName, Account.Name from Contact limit 1];

        Map<String, Object> results = WSU_Util.getFieldNames((Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(con)));

        Map<String, Object> expectedResults = new Map<String, Object>{
            'Id' => null,
            'FirstName' => null,
            'LastName' => null,
            'Email' => null,
            'AccountId' => null,
            'Account' => (Object)new Map<String, Object>{
                'Name' => null,
                'Id' => null
            }
        };

        System.assert(results.equals(expectedResults));
    }

    static testMethod void testGetFieldNamesMultiple() {
        Database.SaveResult saveResult = Database.insert(
            new Account(
                Name = 'TESTACCOUNT',
                BillingCity = 'Some City'
            )
        );
        saveResult = Database.insert(
            new Contact(
                LastName = 'TESTLAST1',
                FirstName = 'TESTFIRST1',
                Email = 'firstlast@email.com',
                AccountId = saveResult.getId()
            )
        );

        saveResult = Database.insert(
            new Account(
                Name = 'TEST2ACCOUNT',
                BillingStreet = 'Main St'
            )
        );
        saveResult = Database.insert(
            new Contact(
                LastName = 'TESTLAST2',
                FirstName = 'TESTFIRST2',
                Salutation = 'Mr',
                AccountId = saveResult.getId()
            )
        );
        
        List<Contact> cons = [select Id, Email, LastName, FirstName, Salutation, Account.Name, Account.BillingState, Account.BillingCity from Contact];

        Map<String, Object> results = WSU_Util.getFieldNames(cons);

        Map<String, Object> expectedResults = new Map<String, Object>{
            'Id' => null,
            'FirstName' => null,
            'LastName' => null,
            'Email' => null,
            'Salutation' => null,
            'AccountId' => null,
            'Account' => (Object)new Map<String, Object>{
                'Id' => null,
                'Name' => null,
                'BillingCity' => null
            }
        };

        System.debug(LoggingLevel.ERROR, 'RES ' + results);
        System.debug(LoggingLevel.ERROR, 'EXP ' + expectedResults);
        System.assert(results.equals(expectedResults));
    }
}
