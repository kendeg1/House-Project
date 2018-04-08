package bbs;

public class Bbs {
	
	public int getListing_id() {
		return listing_id;
	}
	public void setListing_id(int listing_id) {
		this.listing_id = listing_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getRoom_count() {
		return room_count;
	}
	public void setRoom_count(int room_count) {
		this.room_count = room_count;
	}
	public int getBathroom_count() {
		return bathroom_count;
	}
	public void setBathroom_count(int bathroom_count) {
		this.bathroom_count = bathroom_count;
	}
	public int getGuests_count() {
		return guests_count;
	}
	public void setGuests_count(int guests_count) {
		this.guests_count = guests_count;
	}
	public int getMax_cost() {
		return max_cost;
	}
	public void setMax_cost(int max_cost) {
		this.max_cost = max_cost;
	}
	public int getMin_cost() {
		return min_cost;
	}
	public void setMin_cost(int min_cost) {
		this.min_cost = min_cost;
	}
	public int getCondition() {
		return condition;
	}
	public void setCondition(int condition) {
		this.condition = condition;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getAdditional_notes() {
		return additional_notes;
	}
	public void setAdditional_notes(String additional_notes) {
		this.additional_notes = additional_notes;
	}
	private int listing_id;
	private String username;
	private int room_count;
	private int bathroom_count;
	private int guests_count;
	private int max_cost;
	private int min_cost;
	private int condition;
	private String type;
	private int duration;
	private String additional_notes;

	
}
