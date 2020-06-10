package net.dqsy.manager.web.dto;

/*
 * dto模式：将数据封装成普通的javabeans，在j2EE多个层次之间传输
 */
public class MenuDTO {

    private String name;
    private String url;

    public MenuDTO(String name, String url) {
        this.name = name;
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
