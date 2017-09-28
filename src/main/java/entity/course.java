package entity;

/**
 * Created by zhangyan on 2017/9/25.
 */
public class course {
    private String title;
    private String cover;
    private String description;
    private String callbackURL;
    private String price;
    private String movid;


    public String getMovid() {
        return movid;
    }

    public void setMovid(String movid) {
        this.movid = movid;
    }




    public String getTitle() {
        return title;
    }

    public String getCover() {
        return cover;
    }

    public String getDescription() {
        return description;
    }

    public String getCallbackURL() {
        return callbackURL;
    }

    public String getPrice() {
        return price;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCallbackURL(String callbackURL) {
        this.callbackURL = callbackURL;
    }

    public void setPrice(String price) {
        this.price = price;
    }

}
