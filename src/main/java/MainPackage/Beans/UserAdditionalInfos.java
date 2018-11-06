package MainPackage.Beans;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class UserAdditionalInfos {
    private int id;
    private String userId;
    private int infoId;
    private String infoContent;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "userId")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "infoId")
    public int getInfoId() {
        return infoId;
    }

    public void setInfoId(int infoId) {
        this.infoId = infoId;
    }

    @Basic
    @Column(name = "InfoContent")
    public String getInfoContent() {
        return infoContent;
    }

    public void setInfoContent(String infoContent) {
        this.infoContent = infoContent;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserAdditionalInfos that = (UserAdditionalInfos) o;

        if (id != that.id) return false;
        if (infoId != that.infoId) return false;
        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;
        if (infoContent != null ? !infoContent.equals(that.infoContent) : that.infoContent != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + infoId;
        result = 31 * result + (infoContent != null ? infoContent.hashCode() : 0);
        return result;
    }
}
