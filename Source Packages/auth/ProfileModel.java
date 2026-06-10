package auth;

/**
 *
 * @author viozkyyy
 */
public class ProfileModel {
    private int profileId;
    private int userId;
    private String profileName;
    private String profileAvatar;
    private boolean isKids;

    // Constructor Kosong wajib standar JavaBeans
    public ProfileModel() {}

    // Getter dan Setter untuk oper data dari DB ke JSP
    public int getProfileId() { return profileId; }
    public void setProfileId(int profileId) { this.profileId = profileId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getProfileName() { return profileName; }
    public void setProfileName(String profileName) { this.profileName = profileName; }

    public String getProfileAvatar() { return profileAvatar; }
    public void setProfileAvatar(String profileAvatar) { this.profileAvatar = profileAvatar; }

    public boolean isKids() { return isKids; }
    public void setKids(boolean isKids) { this.isKids = isKids; }
}