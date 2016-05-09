package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zcy on 2016/5/6.
 */
public class GetStockNews {
    /**
     * @param stockID
     * @return List<String>
     * 根据股票ID从数据库中得到新闻标题
     */
    public List<String> getNewsTitle(String stockID){
        List<String> titles = getNews(stockID,2);
        return titles;
    }

    /**
     * @param stockID
     * @return List<String>
     * 根据股票ID从数据库中得到新闻正文
     */
    public List<String> getNewsContent(String stockID){
        List<String> contents = getNews(stockID,3);
        return contents;
    }

    private List<String> getNews(String stockID,int n){
        List<String> results = new ArrayList<>();
        Connect co=new Connect();
        String sql="SELECT * FROM companynews where id = \'"+stockID+"\'";
        ResultSet result=co.getResultSet(sql);

        try {
            while(result.next()){
                results.add(result.getString(n));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public static void main(String[] args){
        GetStockNews getStockNews = new GetStockNews();
        for(int i=0;i<5;i++){
            System.out.println(getStockNews.getNewsTitle("sh600015").get(i));
        }
    }
}