package MainPackage.Beans;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class EventParticipants {
    private int id;
    private int eventId;
    private String participantId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "eventId")
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    @Basic
    @Column(name = "participantId")
    public String getParticipantId() {
        return participantId;
    }

    public void setParticipantId(String participantId) {
        this.participantId = participantId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EventParticipants that = (EventParticipants) o;

        if (id != that.id) return false;
        if (eventId != that.eventId) return false;
        if (participantId != null ? !participantId.equals(that.participantId) : that.participantId != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + eventId;
        result = 31 * result + (participantId != null ? participantId.hashCode() : 0);
        return result;
    }
}
