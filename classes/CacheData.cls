public class CacheData {
    private static final String KEY = 'local.test1.userFirstName';

    private static void putCacheOrg() {
        String value = 'test 22222';
        Cache.Org.put(KEY, value);
    }

    public static void getCacheOrg() {
        putCacheOrg();
        if (Cache.Org.contains(KEY)) {
            String myFirstNameFromCache = (String) Cache.Org.get(KEY);
            System.debug('test myFirstNameFromCache ' + myFirstNameFromCache);
        }
    }
}