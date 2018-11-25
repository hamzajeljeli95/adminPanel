package MainPackage.Beans;

import javax.persistence.*;

@Entity
@IdClass(UserAdditionalInfosPK.class)
public class UserAdditionalInfos {
    private int id;
    private String userId;
    private int infoId;
    private String infoContent;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Id
    @Column(name = "userId", nullable = false, length = 64)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Id
    @Column(name = "infoId", nullable = false)
    public int getInfoId() {
        return infoId;
    }

    public void setInfoId(int infoId) {
        this.infoId = infoId;
    }

    @Basic
    @Column(name = "InfoContent", nullable = false, length = 2147483647)
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
