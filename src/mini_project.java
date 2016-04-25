import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.awt.image.*;
import java.sql.*;
import javax.sql.*;
import java.util.*;

public class mini_project extends JFrame
{
	mini_project()
	{
		setTitle("���� ����");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(new BorderLayout());
		
		imgPanel p =new imgPanel();
		add(p,BorderLayout.CENTER);
		
		JButton start = new JButton("���� ����");
		startAction l = new startAction();
		start.addActionListener(l);
		add(start,BorderLayout.SOUTH);
		
		setSize(500, 800);
		setVisible(true);
	}
	
	class imgPanel extends JPanel
	{
		ImageIcon icon= new ImageIcon("����.PNG");
		Image main_img=icon.getImage();
		
		public void paintComponent(Graphics g)
		{
			super.paintComponent(g);
			
			g.drawImage(main_img,0,0,getWidth(),getHeight(),this);
		}
	}
	
	class startAction implements ActionListener
	{
		public void actionPerformed(ActionEvent e)
		{
			new game_frame();
		}
	}

	public static void main(String[] ar)
	{
		new mini_project();
	}
}


class game_frame extends JFrame implements KeyListener,Runnable
{
	int x,y; //ĳ������ ��ġ ����
	
	boolean KeyUp = false;
	boolean KeyDown = false;
	boolean KeyLeft = false;
	boolean KeyRight = false;
	boolean KeySpace = false;
	
	int t,t2;
	
	int player_Speed;
	int missile_Speed;
	int fire_Speed;
	int enemy_Speed;
	int player_State = 0; //����:0,�̻��Ϲ߻�:1,�浹:2
	int game_Score;
	int player_HitPoint;
	
	Thread th;//������ ����
	
	Toolkit tk = Toolkit.getDefaultToolkit();

	Image []me; //�ڱ��ڽ� �̹��� �迭
	Image []explosion;
	Image missile; //�̻��� �̹��� ���� 
	Image enemy; //�� �̹���
	
	ArrayList missile_list = new ArrayList(); //�ټ��� �̻��� �迭
	ArrayList enemy_list = new ArrayList(); //�ټ��� �� �迭
	ArrayList explosion_list=new ArrayList();
	
	Image buffImage;
	Graphics buffg;

	Missile m;//�̻��� ����Ű
	Enemy e; //���ʹ� ���� Ű
	
	game_frame()
	{
		init();
		start();
  
		setTitle("���� ����");
		setSize(600, 800);
		setBackground(Color.WHITE);

		setResizable(false); // �������� ũ�⸦ ���Ƿ� ������ϰ� ����
		setVisible(true); // �������� ���� ���̰� ���ϴ�.
	}
 
	public void init()
	{
		x = 280;
		y = 700;
		
		
		
		me=new Image[3];
		for(int i=0;i<me.length;++i)
		{
			me[i]=new ImageIcon("me_"+i+".png").getImage();
		}
		missile=tk.getImage("missile.png");
		enemy=tk.getImage("enemy.png");
		
		explosion=new Image[3];
		for(int i=0;i<explosion.length;++i)
		{
			explosion[i]=new ImageIcon("explo_"+i+".png").getImage();
		}
		
		game_Score = 0;
		player_HitPoint=3;
		player_Speed=5;
		missile_Speed=10;
		fire_Speed=10;
		enemy_Speed=7;
		
	}

	public void start()
	{
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		addKeyListener(this);
		
		th = new Thread(this);
		
		th.start();
		
	}
	
	public void run()
	{
		try
		{
			while(true)
			{
				KeyProcess();//Ű���� �Է� ó���� �Ͽ� x,y�� ����
				EnemyProcess();
				MissileProcess();
				
				repaint();
				Thread.sleep(30);
				t ++;
			}
		}catch(Exception e){}
	}
	
	public void MissileProcess()
	{
		if(KeySpace==true)
		{
			player_State=1;
			
			if((t%fire_Speed)==0)
			{
				m=new Missile(x,y,missile_Speed);
				missile_list.add(m);
			}
		}
		
		for(int i=0;i<missile_list.size();++i)
		{
			m=(Missile)missile_list.get(i);
			m.move();
			if(m.y>780)
			{
				missile_list.remove(i);
			}
		
			for(int j=0;j<enemy_list.size();++j)
			{
				e=(Enemy)enemy_list.get(j);
				if(Crash(m.x,m.y,e.x,e.y,missile,enemy))
				{
					missile_list.remove(i);
					enemy_list.remove(j);
					
					game_Score +=10;
				}
			}
		}
		
	}
	
	public void EnemyProcess()
	{
		for(int i=0; i<enemy_list.size(); ++i)
		{
			e=(Enemy)(enemy_list.get(i));
			
			e.move();
			if(e.y < -200)
			{
				enemy_list.remove(i);
			}
			
			if(Crash(x,y,e.x,e.y,me[0],enemy))
			{
				player_HitPoint --;
				enemy_list.remove(i);
				if(player_HitPoint==-1)
				{
					final int presentScore;
					presentScore=game_Score;
					class Scoreframe extends JFrame
					{
						int ss=game_Score;
						
						class grades extends JFrame
						{
							ImageIcon chobo = new ImageIcon("�ʺ�.png");
							ImageIcon joongsu = new ImageIcon("�߼�.png");
							ImageIcon gosu = new ImageIcon("���.png");
							ImageIcon chogosu = new ImageIcon("�ʰ��.png");
							ImageIcon god= new ImageIcon("��.png");
							
							JLabel ch=new JLabel(chobo);
							JLabel jo=new JLabel(joongsu);
							JLabel go=new JLabel(gosu);
							JLabel cho=new JLabel(chogosu);
							JLabel g=new JLabel(god);
							
							ImageIcon chobo2 = new ImageIcon("�ʺ�.png");
							ImageIcon joongsu2 = new ImageIcon("�߼�.png");
							ImageIcon gosu2 = new ImageIcon("���.png");
							ImageIcon chogosu2 = new ImageIcon("�ʰ��.png");
							ImageIcon god2= new ImageIcon("��.png");
							
							JLabel ch2=new JLabel(chobo);
							JLabel jo2=new JLabel(joongsu);
							JLabel go2=new JLabel(gosu);
							JLabel cho2=new JLabel(chogosu);
							JLabel g2=new JLabel(god);
				
							grades()
							{
								setTitle("���");
								setLayout(null);
								setBackground(Color.WHITE);
								setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
								
								class gradesPanel extends JPanel
								{
									gradesPanel()
									{
										setLayout(null);
										if(presentScore<50)
										{	
											JLabel k = new JLabel("����� �ʺ� �Դϴ�");
											k.setBounds(95, 20, 200, 15);
											add(k);
											ch2.setBounds(100,35,100,100);
											add(ch2);
										}
										else if(50<=presentScore&&presentScore<100)
										{	
											JLabel k = new JLabel("����� �߼� �Դϴ�");
											k.setBounds(95, 20, 200, 15);
											add(k);
											jo2.setBounds(100,35,100,100);
											add(jo2);
										}
										else if(100<=presentScore&&presentScore<200)
										{	
											JLabel k = new JLabel("����� ��� �Դϴ�");
											k.setBounds(95, 20, 200, 15);
											add(k);
											go2.setBounds(100,35,100,100);
											add(go2);
										}
										else if(200<=presentScore&&presentScore<400)
										{	
											JLabel k = new JLabel("����� �ʰ�� �Դϴ�");
											k.setBounds(95, 20, 200, 15);
											add(k);
											cho2.setBounds(100,35,100,100);
											add(cho2);
										}
										else
										{	
											JLabel k = new JLabel("����� �� �Դϴ�");
											k.setBounds(95, 20, 200, 15);
											add(k);
											g2.setBounds(100,35,100,100);
											add(g2);
										}
									}
								}								
								gradesPanel gP=new gradesPanel();
								gP.setBounds(0, 0, 300, 300);
								add(gP);
								JLabel l1 = new JLabel("�ʺ�(50�� �̸�)");
								JLabel l2 = new JLabel("�߼�(50�� �̻� 100�� �̸�)");
								JLabel l3 = new JLabel("���(100�� �̻� 200�� �̸�)");
								JLabel l4 = new JLabel("�ʰ��(200�� �̻� 400�� �̸�)");
								JLabel l5 = new JLabel("��(400�� �̻�)");
								
								ch.setBounds(10,300,100,100); 
								jo.setBounds(10,350,100,100);
								go.setBounds(10,400,100,100);
								cho.setBounds(10,450,100,100);
								g.setBounds(10,500,100,100);
								l1.setBounds(100, 350, 300, 20);
								l2.setBounds(100, 400, 300, 20);
								l3.setBounds(100, 450, 300, 20);
								l4.setBounds(100, 500, 300, 20);
								l5.setBounds(100, 550, 300, 20);
								
								add(ch);
								add(jo);
								add(go);
								add(cho);
								add(g);
								
								add(l1);
								add(l2);
								add(l3);
								add(l4);
								add(l5);
								setSize(300,700);
								setVisible(true);
							}
						}
						
						JButton b1;
						Scoreframe()
						{
							setTitle("������");
							setLayout(null);
							setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
							String id = JOptionPane.showInputDialog("id�� �Է��Ͻÿ�.");
							
							try{
							Class.forName("com.mysql.jdbc.Driver");
							String url="jdbc:mysql://localhost:3306/mydatabase";
							Connection conn= DriverManager.getConnection(url,"root","shdkdl");
							Statement stmt=conn.createStatement();
							String strSQL="SELECT id FROM member where ID='"+id+"'";
							ResultSet rs=stmt.executeQuery(strSQL);
							if(!rs.next())
							{
								JOptionPane.showMessageDialog(this, "ID�� �����ó׿� ȸ�������� �� �ּ���", "ȸ�� ���� ���", JOptionPane.INFORMATION_MESSAGE);				
							}
							else
							{	
								JLabel t1=new JLabel(id+"���� ������"+game_Score+"���Դϴ�.");
								stmt=conn.createStatement();
								strSQL="UPDATE member set score ='"+ss+"' where ID='"+id+"'";
								stmt.executeUpdate(strSQL);
								t1.setSize(400,20);
								t1.setLocation(50,100);
								add(t1);
								b1 = new JButton("��� ����");
								MyAction l = new MyAction();
								b1.addActionListener(l);
								b1.setBounds(95, 150, 100, 50);
								add(b1);
								
								setSize(300,300);
								setVisible(true);
							}

							}
							catch(Exception e){}

						}	
						
						class MyAction implements ActionListener
						{
							public void actionPerformed(ActionEvent e)
							{
								new grades();
							}
						}
					}new Scoreframe();
				}
				game_Score+=10;
			}
			
			
		}
		if(t % 40 ==0)
		{
			e = new Enemy(10, 0,enemy_Speed);
			enemy_list.add(e);
			e = new Enemy(140, 0,enemy_Speed);
			enemy_list.add(e);
			e = new Enemy(265, 0,enemy_Speed);
			enemy_list.add(e);
			e = new Enemy(390, 0,enemy_Speed);
			enemy_list.add(e);
			e = new Enemy(536, 0,enemy_Speed);
			enemy_list.add(e);
		}
	}
	
	
	public boolean Crash(int x1, int y1, int x2, int y2, Image img1, Image img2)
	{
		boolean check = false;


		if (Math.abs((x1 + img1.getWidth(null) / 2)- (x2 + img2.getWidth(null) / 2)) < (img2.getWidth(null) / 2 + img1.getWidth(null) / 2)
				&& 
			Math.abs((y1 + img1.getHeight(null) / 2) - (y2 + img2.getHeight(null) / 2)) < (img2.getHeight(null) / 2 + img1.getHeight(null) / 2))
		{		
			check = true;//�� ���� true�� check�� true�� �����մϴ�.		
		}
		else
		{ check = false;}
		return check; //check�� ���� �޼ҵ忡 ���� ��ŵ�ϴ�.
	}
	
	public void paint(Graphics g)
	{
		buffImage = createImage(600,800);

		buffg = buffImage.getGraphics();

		update(g);
	}
	
	public void update(Graphics g)
	{
		Draw();
		
		Draw_Enemy();
		
		Draw_missile();
		
		Draw_StatusText();
		
		g.drawImage(buffImage,0,0,this);
	}
	
	public void Draw()
	{ 
		switch (player_State)
		{ 
			case 0 : // ����
			if((t / 5 %2) == 0)
			{ 
				buffg.drawImage(me[0], x, y, this);
			}else { buffg.drawImage(me[0], x, y, this); }
			break;


			case 1 : // �̻��Ϲ߻�
			if((t / 5 % 2) == 0)
			{ 
				buffg.drawImage(me[1], x, y, this);
			}else { buffg.drawImage(me[2], x, y, this); }


			player_State = 0;
			//�̻��� ��Ⱑ ������ �÷��̾� ���¸� 0���� ������. 


			break;


			case 2 : // �浹
			break;
		}
	}

	
	public void Draw_missile()
	{
		for(int i=0; i<missile_list.size();++i)
		{
			m=(Missile)(missile_list.get(i));
			
			buffg.drawImage(missile,m.x,m.y,this);
			
			m.move();
			
			if(m.y>800)
			{
				missile_list.remove(i);
			}
		}
	}
	
	public void Draw_Enemy()
	{
		for (int i = 0 ; i < enemy_list.size() ; ++i )
		{
			e = (Enemy)(enemy_list.get(i));
			buffg.drawImage(enemy, e.x, e.y, this);
		}
	}
	
	public void Draw_StatusText()
	{
		buffg.setFont(new Font("Defualt",Font.BOLD,20));
		buffg.drawString("����: " + game_Score, 50, 50);
		buffg.drawString("�� : " + player_HitPoint, 50, 70);
	}

	
	public void keyPressed(KeyEvent e)
	{
		switch(e.getKeyCode())
		{
		case KeyEvent.VK_UP:KeyUp=true; break;
		case KeyEvent.VK_DOWN:KeyDown=true; break;
		case KeyEvent.VK_LEFT:KeyLeft=true; break;
		case KeyEvent.VK_RIGHT:KeyRight=true; break;
		case KeyEvent.VK_SPACE:KeySpace=true; break;
		}
	}
	
	public void keyReleased(KeyEvent e)
	{
		switch(e.getKeyCode())
		{
		case KeyEvent.VK_UP:KeyUp=false; break;
		case KeyEvent.VK_DOWN:KeyDown=false; break;
		case KeyEvent.VK_LEFT:KeyLeft=false; break;
		case KeyEvent.VK_RIGHT:KeyRight=false; break;
		case KeyEvent.VK_SPACE:KeySpace=false; break;
		}
	}
	
	public void keyTyped(KeyEvent e){}
	
	public void KeyProcess()
	{
		if(KeyUp == true) y-=8;
		if(KeyDown == true) y+=8;
		if(KeyLeft == true) x-=8;
		if(KeyRight == true) x+=8;	
	}
	
	class Missile
	{
		int x,y;
		
		int speed;
		
		Missile(int x,int y,int speed)
		{
			this.x=x+20;
			this.y=y;
			this.speed=speed;
		}
		
		public void move()
		{
			y -= speed;
		}
	}
	
	class Enemy
	{
		int x,y;
		
		int speed;
		
		Enemy(int x, int y,int speed)
		{
			this.x=x;
			this.y=y;
			this.speed=speed;
		}
		
		public void move()
		{
			y+=speed;
		}
	}
}
