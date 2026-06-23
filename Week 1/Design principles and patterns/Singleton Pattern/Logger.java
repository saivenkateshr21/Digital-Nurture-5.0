public class Logger {
    private static Logger instance;

    private Logger() {
        //private logger class 
    }

    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }

    public void log(String message) {
        System.out.println("Logged: " + message);
    }
}

