package corpus;

/* POJO to simply extract id,date,title from a csv file containing the corpus */

public class Article {

    public String id;
    public String title;
    public String date;

    public Article(String id, String title, String date)
    {
        this.id = id;
        this.title = title;
        this.date = date;
    }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    public String getId() { return id; }

    public void setId(String id) { this.id = id; }

    public String getDate() { return date; }

    public void setDate(String date) { this.date = date; }
}
