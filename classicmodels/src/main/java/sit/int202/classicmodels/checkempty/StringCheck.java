package sit.int202.classicmodels.checkempty;

public class StringCheck {
    public static boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
}

