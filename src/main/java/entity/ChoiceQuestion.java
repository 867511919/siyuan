package entity;

/**
 * Created by null on 2017/8/28.
 */
public class ChoiceQuestion {
    private int id;
    private String title;
    private String body;
    private String detailA;
    private String detailB;
    private String detailC;
    private String detailD;
    private String rank;
    private String explain;
    private String std;

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public void setDetailA(String detailA) {
        this.detailA = detailA;
    }

    public void setDetailB(String detailB) {
        this.detailB = detailB;
    }

    public void setDetailC(String detailC) {
        this.detailC = detailC;
    }

    public void setDetailD(String detailD) {
        this.detailD = detailD;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public void setExplain(String explain) {
        this.explain = explain;
    }

    public void setStd(String std) {
        this.std = std;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getBody() {
        return body;
    }

    public String getDetailA() {
        return detailA;
    }

    public String getDetailB() {
        return detailB;
    }

    public String getDetailC() {
        return detailC;
    }

    public String getDetailD() {
        return detailD;
    }

    public String getRank() {
        return rank;
    }

    public String getExplain() {
        return explain;
    }

    public String getStd() {
        return std;
    }
    public String toString(){
        return "题目编号："+this.id+" 题目标题: "+this.title+" 题目难度："+this.rank;
    }

}
