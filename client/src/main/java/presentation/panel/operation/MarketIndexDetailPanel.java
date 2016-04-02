package presentation.panel.operation;

import bl.ShowIndexData;
import presentation.frame.MainFrame;
import presentation.graphs.LineChartMarketIndex;
import vo.IndexVO;

import javax.imageio.plugins.jpeg.JPEGHuffmanTable;
import javax.swing.*;
import java.awt.*;
import java.io.IOException;

/**
 * Created by zmj on 2016/3/31.
 */
public class MarketIndexDetailPanel extends JPanel {
    private JTabbedPane tabbedPane;
    private JPanel lineChartMarketIndexVolume;
    private JPanel lineChartMarketIndexHigh;
    private JPanel lineChartMarketIndexLow;
    private JPanel lineChartMarketIndexOpen;
    private JPanel lineChartMarketIndexClose;
    private JPanel lineChartMarketIndexADJPrice;

    public MarketIndexDetailPanel() throws IOException {
        this.setLayout(new BorderLayout());
        this.setBounds(0, 0, MainFrame.getMainFrame().getWidth(), MainFrame.getMainFrame().getHeight());
        init();
        initComponents();
    }

    private void init() throws IOException {
        IndexVO index = new ShowIndexData().getLatestIndexData();
        String nameVolume[] = {"日期", "成交量", "大盘指数"};
        long volume[] = index.getVolume();
        lineChartMarketIndexVolume = new LineChartMarketIndex(nameVolume, volume).getChartPanel();
        String nameHigh[] = {"日期", "最高价", "大盘指数"};
        double high[] = index.getHigh();
        lineChartMarketIndexHigh = new LineChartMarketIndex(nameHigh, high).getChartPanel();
        String nameLow[] = {"日期", "最低价", "大盘指数"};
        double low[] = index.getLow();
        lineChartMarketIndexLow = new LineChartMarketIndex(nameLow, low).getChartPanel();
        String nameOpen[] = {"日期", "开盘价", "大盘指数"};
        double open[] = index.getOpen();
        lineChartMarketIndexOpen = new LineChartMarketIndex(nameOpen, open).getChartPanel();
        String nameClose[] = {"日期", "收盘价", "大盘指数"};
        double close[] = index.getClose();
        lineChartMarketIndexClose = new LineChartMarketIndex(nameClose, close).getChartPanel();
        String namePrice[] = {"日期", "最新价", "大盘指数"};
        double price[] = index.getAdj_price();
        lineChartMarketIndexADJPrice = new LineChartMarketIndex(namePrice, price).getChartPanel();


        tabbedPane = new JTabbedPane();
        ImageIcon image1 = new ImageIcon("client\\src\\main\\resources\\images\\volume.png");
        ImageIcon image2 = new ImageIcon("client\\src\\main\\resources\\images\\high.png");
        ImageIcon image3 = new ImageIcon("client\\src\\main\\resources\\images\\low.png");
        ImageIcon image4 = new ImageIcon("client\\src\\main\\resources\\images\\price.png");
        ImageIcon image5 = new ImageIcon("client\\src\\main\\resources\\images\\open.png");
        ImageIcon image6 = new ImageIcon("client\\src\\main\\resources\\images\\close.png");
        //tabbedPane.addTab(title, icon, component, tip);
        //添加由 title 和/或 icon 表示的 component 和 tip，其中任意一个都可以为 null。

        tabbedPane.addTab(null, image1, lineChartMarketIndexVolume, "成交量");
        tabbedPane.addTab(null, image2, lineChartMarketIndexHigh, "最高价");
        tabbedPane.addTab(null, image3, lineChartMarketIndexLow, "最低价");
        tabbedPane.addTab(null, image4, lineChartMarketIndexADJPrice, "最新价");
        tabbedPane.addTab(null, image5, lineChartMarketIndexOpen, "开盘价");
        tabbedPane.addTab(null, image6, lineChartMarketIndexClose, "收盘价");
    }

    private void initComponents() {
        tabbedPane.setTabPlacement(JTabbedPane.NORTH);
        //	tabbedPane.setTabPlacement(JTabbedPane.LEFT);
        this.add(tabbedPane);
    }

    public static void main(String[] args) throws IOException {
        JFrame jFrame = new JFrame();
        jFrame.add(new MarketIndexDetailPanel());
        jFrame.setBounds(50, 50, 800, 600);
        jFrame.setVisible(true);
    }

}
