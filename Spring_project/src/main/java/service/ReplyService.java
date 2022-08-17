package service;

import java.util.List;

import command.ReplyCommand;

public interface ReplyService {

	/* 댓글 등록 */
	public int addReply(ReplyCommand replyCommand) throws Exception;
	
	/* 전체 댓글 리스트 가져오기 */
	public List<ReplyCommand> getReplyListAll(int productId) throws Exception;
	
	/* 댓글 삭제 */
	public void deleteReply(String memberId, int productId) throws Exception;
	
	/* 댓글 평균 평점 계산 */
	public void updateRatingAvg(int productId) throws Exception;
}
