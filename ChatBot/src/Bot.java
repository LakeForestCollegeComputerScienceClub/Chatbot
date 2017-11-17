import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.JTextArea;

public class Bot extends JFrame
{
	//typing area
	private JTextField txtEnter = new JTextField();
	
	//chat area
	private JTextArea txtChat = new JTextArea();
	
	public Bot()
	{
		
		//this part deals with how the window looks/behaves when you run the chatbot
		//frame attributes
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setSize(600, 600);
		this.setVisible(true);
		this.setResizable(false);
		this.setTitle("Java AI");
		
		//txtEnter attributes
		txtEnter.setLocation(2,540);
		txtEnter.setSize(590,30);
		
		//txtEnter action event
		txtEnter.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent arg0)
			{
				String uText = txtEnter.getText();
				txtChat.append("You: " + uText + "\n");
				txtEnter.setText("");
				
				//these 'if' statements are the logic of the chatbot
				//add more 'if' blocks to make it respond to more phrases
				if(uText.contains("hi"))
				{
					botSay("Hello there.");
				}
				else if(uText.contains("how are you"))
				{
					botSay("I'm fine, thanks.");
				}
				else
				{
					//you can use random number generation, as below, to make the bot's responses seem less static
					int decider = (int) (Math.random() * 3 + 1);
					if(decider == 1)
					{
						botSay("I didn't get that.");
					}
					else if(decider == 2)
					{
						botSay("Please rephrase that.");
					}
					else if(decider == 3)
					{
						botSay("I don't understand.");
					}
				}
			}
		});
		
		//txtChat attributes
		txtChat.setLocation(20,5);
		txtChat.setSize(560,510);
		txtChat.setEditable(false);
		
		//add items to frame
		this.add(txtEnter);
		this.add(txtChat);
	}
	
	//this part defines a function to make the bot say stuff
	public void botSay(String s)
	{
		txtChat.append("AI: " + s + "\n");
	}
	
	//this part creates a new bot object which does the stuff we defined above
	public static void main(String[] args)
	{
		new Bot();
	}
}
