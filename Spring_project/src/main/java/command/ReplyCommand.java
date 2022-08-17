package command;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyCommand {
	
	private int replyId;
	
	private int productId;
	
	private String memberId;
	
	private String content;
	
	private double rating;
	
	private Date regDate;
	
	private String memberName;
	
}
