import java.awt.LayoutManager;
import javax.swing.JButton;
import javax.swing.JFrame;

public class guitest {
   public static void main(String[] var0) {
      JFrame var1 = new JFrame();
      JButton var2 = new JButton("JAVA GUI TEST");
      var2.setBounds(130, 100, 200, 40);
      var1.add(var2);
      var1.setSize(400, 500);
      var1.setLayout((LayoutManager)null);
      var1.setVisible(true);
   }
}