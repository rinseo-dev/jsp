package vote;

import java.util.Arrays;

public class VoteItem {
	
	private int listnum;
	private int itemnum;
	private String[] item;// 여러값이 들어오므로 배열로 처리
	private int count;
	
	//constructor
	public VoteItem() {
	}
	
	public VoteItem(int listnum, int itemnum, String[] item, int count) {
		super();
		this.listnum = listnum;
		this.itemnum = itemnum;
		this.item = item;
		this.count = count;
	}

	
	// getter / setter
	public int getListnum() {
		return listnum;
	}

	public void setListnum(int listnum) {
		this.listnum = listnum;
	}

	public int getItemnum() {
		return itemnum;
	}

	public void setItemnum(int itemnum) {
		this.itemnum = itemnum;
	}

	public String[] getItem() {
		return item;
	}

	public void setItem(String[] item) {
		this.item = item;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	// toString
	@Override
	public String toString() {
		return "VoteItem [listnum=" + listnum + ", itemnum=" + itemnum + ", item=" + Arrays.toString(item) + ", count="
				+ count + "]";
	}

}
