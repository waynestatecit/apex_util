// This file is part of WSU_Util, a set of generic Apex utilities for the Force.com platform.
//
// Copyright 2013-2014, Wayne State University
// License: 3-clause BSD license.  See LICENSE.

public class WSU_Util {
    
    // Begin Utilities for Maps of Lists
    // Handle creating a new List inside a map or pushing onto an existing List at that key
    public static void sCreateOrAdd(Map<String, List<Object>> aMap, String key, Object value, Boolean toCast) {
        if (aMap.containsKey(key)) {
            aMap.get(key).add(value);
        } else {
            if (toCast) {
                if (value instanceof ID) {
                    aMap.put(key, new List<ID>{(ID)value});
                } else if (value instanceof String) {
                    aMap.put(key, new List<String>{(String)value});
                } else if (value instanceof Long) {
                    try {
                        aMap.put(key, new List<Long>{(Long)value});
                    } catch (System.TypeException e) {
                        aMap.put(key, new List<Integer>{(Integer)value});
                    }
                } else if (value instanceof Double) {
                    aMap.put(key, new List<Double>{(Double)value});
                } else if (value instanceof Boolean) {
                    aMap.put(key, new List<Boolean>{(Boolean)value});
                } else if (value instanceof Date) {
                    aMap.put(key, new List<Date>{(Date)value});
                } else if (value instanceof Time) {
                    aMap.put(key, new List<Time>{(Time)value});
                } else if (value instanceof Datetime) {
                    aMap.put(key, new List<Datetime>{(Datetime)value});
                } else if (value instanceof Blob) {
                    aMap.put(key, new List<Blob>{(Blob)value});
                } else {
                    aMap.put(key, new List<Object>{value});
                }
            } else {
                aMap.put(key, new List<Object>{value});
            }
        }
    }

    public static void sCreateOrAdd(Map<String, List<Object>> aMap, String key, Object value) {
        sCreateOrAdd(aMap, key, value, true);
    }

    public void createOrAdd(Map<String, List<Object>> aMap, String key, Object value, Boolean toCast) {
        WSU_Util.sCreateOrAdd(aMap, key, value, toCast);
    }

    public void createOrAdd(Map<String, List<Object>> aMap, String key, Object value) {
        CreateOrAdd(aMap, key, value, true);
    }

    // Yeah, I know these next two are partially redundant.  I'm not sure it makes sense to modularize them
    // if I can't pass a callback function or something.
    public static Map<String, Object> sCreateOrAdd(Map<String, Object> aMap, List<String> keys, sObject value) {
        if (keys.size() > 0) {
            if (keys.size() == 1) {
                Map<String, List<Object>> newMap = new Map<String, List<Object>>();
                for (String aMapKey : aMap.keySet()) {
                    List<Object> newList = new List<Object>();
                    for (Object obj : (List<Object>)aMap.get(aMapKey)) {
                        newList.add(obj);
                    }
                    newMap.put(aMapKey, newList);
                }
                sCreateOrAdd(newMap, keys.get(0), (Object)value);
                aMap = (Map<String, Object>)newMap;
            } else {
                if (aMap.containsKey(keys.get(0))) {
                    List<String> newKeys = new List<String>(keys);
                    newKeys.remove(0);
                    aMap.put(keys.get(0), (Map<String, Object>)sCreateOrAdd((Map<String, Object>)aMap.get(keys.get(0)), newKeys, value));
                } else {
                    Map<String, List<Object>> newMap = new Map<String, List<Object>>();
                    sCreateOrAdd(newMap, keys.get(keys.size() - 1), (Object)value, false);
                    Map<String, Object> wrappedMap = (Map<String, Object>)newMap;
                    for (Integer i = keys.size() - 2; i > 0; i--) {
                        wrappedMap = new Map<String, Object>{keys.get(i) => (Object)wrappedMap};
                    }
                    aMap.put(keys.get(0), (Object)wrappedMap);
                }
            }
        } else {
            throw new UtilException();
        }
        return (Map<String, Object>)aMap;
    }

    public Map<String, Object> createOrAdd(Map<String, Object> aMap, List<String> keys, sObject value) {
        return WSU_Util.sCreateOrAdd(aMap, keys, value);
    }

    public static void sCreateOrAdd(Map<String, Object> aMap, List<String> keys, Object value) {
        if (keys.size() > 0) {
            if (keys.size() == 1) {
                sCreateOrAdd((Map<String, List<Object>>)aMap, keys.get(0), value);
            } else {
                if (aMap.containsKey(keys.get(0))) {
                    List<String> newKeys = new List<String>(keys);
                    newKeys.remove(0);
                    sCreateOrAdd((Map<String, Object>)aMap.get(keys.get(0)), newKeys, value);
                } else {
                    Map<String, List<Object>> newMap = new Map<String, List<Object>>();
                    sCreateOrAdd(newMap, keys.get(keys.size() - 1), value, false);
                    Map<String, Object> wrappedMap = (Map<String, Object>)newMap;
                    for (Integer i = keys.size() - 2; i > 0; i--) {
                        wrappedMap = new Map<String, Object>{keys.get(i) => (Object)wrappedMap};
                    }
                    aMap.put(keys.get(0), (Object)wrappedMap);
                }
            }
        } else {
            throw new UtilException();
        }
    }

    public void createOrAdd(Map<String, Object> aMap, List<String> keys, Object value) {
        WSU_Util.sCreateOrAdd(aMap, keys, value);
    }

    public static void sCreateOrAdd(Map<String, List<sObject>> aMap, String key, sObject value) {
        if (aMap.containsKey(key)) {
            aMap.get(key).add(value);
        } else {
            aMap.put(key, new List<sObject>{value});
        }
    }

    public void createOrAdd(Map<String, List<sObject>> aMap, String key, sObject value) {
        WSU_Util.sCreateOrAdd(aMap, key, value);
    }
    // End Utilities for Maps of Lists

    // Begin Utilities for Map merging
    public static void sMrge(Map<String, Object> toUpdate, Map<String, Object> source, Boolean clobberDifferentCompositeTypes) {
        for (String sourceKey : source.keySet()) {
            if (toUpdate.containsKey(sourceKey)) {
                // If types match, try to merge Sets, Lists, Maps
                if (toUpdate.get(sourceKey) instanceof Set<Object> &&
                    source.get(sourceKey) instanceof Set<Object>) {
                    ((Set<Object>)toUpdate.get(sourceKey)).addAll((Set<Object>)source.get(sourceKey));
                } else if (
                    toUpdate.get(sourceKey) instanceof List<Object> &&
                    source.get(sourceKey) instanceof List<Object>
                ) {
                    ((List<Object>)toUpdate.get(sourceKey)).addAll((List<Object>)source.get(sourceKey));
                } else if (
                    toUpdate.get(sourceKey) instanceof Map<String, Object> &&
                    source.get(sourceKey) instanceof Map<String, Object>
                ) {
                    sMrge((Map<String, Object>)toUpdate.get(sourceKey), (Map<String, Object>)source.get(sourceKey), clobberDifferentCompositeTypes);
                } else {
                    if ((
                        toUpdate.get(sourceKey) instanceof Set<Object> ||
                        toUpdate.get(sourceKey) instanceof List<Object> ||
                        toUpdate.get(sourceKey) instanceof Map<String, Object>
                        )) {
                        if(clobberDifferentCompositeTypes) {
                            toUpdate.put(sourceKey, source.get(sourcekey));
                        }
                    } else {
                        toUpdate.put(sourceKey, source.get(sourcekey));
                    }
                }
            } else {
                toUpdate.put(sourceKey, source.get(sourcekey));
            }
        }
    }

    public static void sMrge(Map<String, Object> toUpdate, Map<String, Object> source) {
        sMrge(toUpdate, source, true);
    }

    public void mrge(Map<String, Object> toUpdate, Map<String, Object> source) {
        sMrge(toUpdate, source);
    }

    public void mrge(Map<String, Object> toUpdate, Map<String, Object> source, Boolean clobberDifferentCompositeTypes) {
        sMrge(toUpdate, source, clobberDifferentCompositeTypes);
    }
    // End Utilities for Map merging

    // Start Utilities for SOQL parsing
    public static Map<String, Object> parseSOQL(String query) {
        // I need to know what fields are requested
        // David Thompson came up with this awesome hack - convert the SOQL to XML and use the native XML parser
        String queryXml = '<soql>' + query.replace('(', '<paren>').replace(')', '</paren>') + '</soql>';
        Dom.Document doc = new Dom.Document();
        doc.load(queryXml);
        return analyzeSOQLNode(doc.getRootElement());
    }

    private static Map<String, Object> analyzeSOQLNode(Dom.XmlNode node) {
        List<Dom.XmlNode> parens = new List<Dom.XmlNode>();
        String strippedQuery = '';
        for (Dom.XmlNode child : node.getChildren()) {
            if (child.getNodeType().name() == 'TEXT') {
                strippedQuery += child.getText();
            } else if (child.getNodeType().name() == 'ELEMENT') {
                strippedQuery += '*paren' + String.valueOf(parens.size()) + '*';
                parens.add(child);
            }
        }

        Pattern pullFields = Pattern.compile('^\\s*select\\s+([\\w\\*,. ]*)\\s+from\\s+(\\S+)(.*)$');
        Matcher match = pullFields.matcher(strippedQuery);
        
        List<Object> fields = new List<Object>();
        String frm = null;
        Pattern findPlaceholder = Pattern.compile('\\*paren(\\d)+\\*');
        if (match.matches()) {
            if (match.groupCount() > 2) {
                String fieldsString = match.group(1);
                for (String field : fieldsString.split(',')) {
                    field = field.deleteWhitespace();
                    Matcher fieldMatch = findPlaceholder.matcher(field);
                    if (fieldMatch.matches()) {
                        fields.add((Object)analyzeSOQLNode(
                            parens.get(Integer.valueOf(fieldMatch.group(1)))
                        ));
                    } else {
                        fields.add((Object)field);
                    }
                }
                frm = match.group(2);
            }
        }
        
        return new Map<String, Object>{
            'fields' => (Object)fields,
            'from' => frm
        };
    }
    // End utilities for SOQL parsing

    // Start utilities for sObject inspection

    public static Map<String, Object> getFieldNames(sObject sobj) {
        Map<String, Object> results = new Map<String, Object>();
        getFieldNames(sobj, results);
        return results;
    }

    public static Map<String, Object> getFieldNames(List<sObject> sobjs) {
        Map<String, Object> results = new Map<String, Object>();
        getFieldNames(sobjs, results);
        return results;
    }

    public static Map<String, Object> getFieldNames(Map<String, Object> sobjMap) {
        Map<String, Object> results = new Map<String, Object>();
        getFieldNames(sobjMap, results);
        return results;
    }

    public static void getFieldNames(sObject sobj, Map<String, Object> results) {
        getFieldNames((Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(sobj)), results);
    }

    public static void getFieldNames(List<sObject> sobjs, Map<String, Object> results) {
        for (sObject sobj : sobjs) {
            getFieldNames(sobj, results);
        }
    }

    public static void getFieldNames(Map<String, Object> sobjMap, Map<String, Object> results) {
        for (String fieldName : sobjMap.keySet()) {
            if (fieldName != 'attributes') {
                Object value = sobjMap.get(fieldName);
                if (value != null && value instanceof Map<String, Object>) {
                    Map<String, Object> internalResults = null;
                    if (results.containsKey(fieldName)) {
                        internalResults = (Map<String, Object>)results.get(fieldName);
                    } else {
                        internalResults = new Map<String, Object>();
                    }
                    getFieldNames((Map<String, Object>)value, internalResults);
                    results.put(fieldName, internalResults);
                } else {
                    // I could check here so I don't clobber, but I bet that's even slower.
                    results.put(fieldName, null);
                }
            }
        }
    }

    // End utilities for sObject inspection

    public class UtilException extends Exception {}
    public class UtilDMLRowsException extends Exception {}
    public class UtilDMLStatementsException extends Exception {}
}
