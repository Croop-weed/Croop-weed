package main;

import entity.*;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import javax.swing.JPanel;

public class GamePanel extends JPanel implements Runnable {

    //Screnn Setting
    final int originalTileSize = 16;//16 pixle
    final int Scale = 3;//make the thing look big

    public final int tileSize = originalTileSize * Scale;//48pixel
    final int maxScreenCol = 16;
    final int maxScreenRow = 12;
    final int screenWidth = tileSize * maxScreenCol;  //768px
    final int screenHeight = tileSize * maxScreenRow; //576px

    //fps
    int fps = 60;

    keyHandler keyH = new keyHandler();//key input
    Thread gameThread;//it keeps thing running or make or fps if you do something
    Player player = new Player(this,keyH);//for the movements animation



    public GamePanel() {
        this.setPreferredSize(new Dimension(screenWidth, screenHeight));
        this.setBackground(Color.BLACK);
        this.setDoubleBuffered(true);
        this.addKeyListener(keyH);//key input through keyHandler.java
        this.setFocusable(true);//ensure the key input is taken by the game

    }

    //fps
    public void startGameThread() {

        gameThread = new Thread(this);
        gameThread.start();

    }

    @Override
    public void run() {

        //accumulator method
        double drawInterval = 1000000000 / fps;//0.0166 sec
        double delta = 0;
        long lastTime = System.nanoTime();
        long currentTime;
        long timer = 0;
        int drawCount = 0;

        //game loop
        while (gameThread != null) {

            currentTime = System.nanoTime();

            delta += (currentTime - lastTime) / drawInterval;

            timer += (currentTime - lastTime);

            lastTime = currentTime;

            if (delta >= 1) {

                //1. update information (change in position using key such as up)
                update();
                //2. draw the screen with the upload information
                repaint();
                delta--;
                drawCount++;

            }

            if (timer >= 1000000000) {
                System.out.println("FPS" + drawCount);
                drawCount = 0;
                timer = 0;
            }

        }
    }

    public void update() {
        player.update();

    }

    public void paintComponent(Graphics g) {

        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;//graphic of the character

        player.draw(g2);
        g2.dispose();
    }
}
