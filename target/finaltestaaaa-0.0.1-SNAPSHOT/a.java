import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

public class MainClass {
    public static void main(String[] args) {
        String relativePath = "logincus.jsp";

        try {
            URI uri = new File(relativePath).toURI();
            Desktop.getDesktop().browse(uri);
        } catch (IOException | URISyntaxException e) {
            e.printStackTrace();
        }
    }
}